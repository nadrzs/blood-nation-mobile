import 'package:blood_nation/components/widgets/input_field.dart';
import 'package:blood_nation/pages/login_page.dart';
import 'package:blood_nation/provider/register_provider.dart';
import 'package:blood_nation/provider/validation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

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
                  "Register",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Create an Account",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/register.png"),
                          fit: BoxFit.fitHeight)),
                ),
                SizedBox(height: 30),
                // Username
                InputField(
                  icon: Icons.account_circle_rounded,
                  label: "Username",
                  controller: username,
                  inputType: TextInputType.text,
                  validator: (value) =>
                      provider.validator(value, "Username is required"),
                ),

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

                // Phone Number
                InputField(
                  icon: Icons.phone,
                  label: "Phone Number",
                  controller: phoneNumber,
                  inputType: TextInputType.phone,
                  inputFormat: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) => provider.phoneValidator(value),
                ),
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
                          final user = await registerUser(
                            username.text,
                            email.text,
                            password.text,
                            phoneNumber.text,
                          );
                          print(user);

                          if (user != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
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
                      "Register",
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
                      "Already have an account?",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    InkWell(
                      child: Text(
                        " Log In",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
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
