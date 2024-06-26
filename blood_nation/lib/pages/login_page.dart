import 'package:blood_nation/components/widgets/input_field.dart';
import 'package:blood_nation/pages/navbar.dart';
import 'package:blood_nation/pages/register_page.dart';
import 'package:blood_nation/provider/login_provider.dart';
import 'package:blood_nation/provider/validation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  final provider = ValidationProvider();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  "Log In",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Log In to Your Account",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/login.png"),
                          fit: BoxFit.fitHeight)),
                ),
                SizedBox(height: 30),
                // Email
                InputField(
                  icon: Icons.email,
                  label: "Email",
                  controller: email,
                  inputType: TextInputType.emailAddress,
                  validator: (value) => provider.emailValidator(value),
                ),

                // Password
                Consumer<ValidationProvider>(
                    builder: (context, notifier, child) {
                  return InputField(
                    icon: Icons.lock,
                    label: "Password",
                    controller: password,
                    isVisible: notifier.isVisible,
                    trailing: IconButton(
                      onPressed: () => notifier.showHidePassword(),
                      icon: Icon(!notifier.isVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    validator: (value) => provider.passwordValidator(value),
                  );
                }),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    elevation: 0,
                    color: Color(0xffC31C2B),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          final user = await loginUser(
                            email.text,
                            password.text,
                          );
                          print(user);

                          if (user != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Navbar()),
                            );
                          }
                        } catch (e) {
                          provider.showSnackBar(
                              "Failed to register user", context);
                        }
                      } else {
                        provider.showSnackBar(
                            "Please fill in all fields", context);
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't Have an Account? ",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    InkWell(
                      child: Text(
                        "Register Here",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
