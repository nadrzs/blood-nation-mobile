import 'package:blood_nation/components/input_field.dart';
import 'package:blood_nation/pages/navbar.dart';
import 'package:blood_nation/pages/register.dart';
import 'package:blood_nation/provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final address = TextEditingController();
  final age = TextEditingController();
  final weight = TextEditingController();
  final bloodType = TextEditingController();

  final provider = SettingProvider();
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
                Text(
                  "Reservation",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/reservation.png"),
                          fit: BoxFit.fitHeight)),
                ),
                SizedBox(height: 5),
                // Address
                InputField(
                  icon: Icons.location_city,
                  label: "Address",
                  controller: address,
                  inputType: TextInputType.text,
                  validator: (value) => provider.validator(value, "Address is Required"),
                ),
                SizedBox(height: 5),
                // Age
                InputField(
                  icon: Icons.person,
                  label: "Age",
                  controller: age,
                  inputType: TextInputType.number,
                  inputFormat: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) => provider.ageValidator(value),
                ),
                SizedBox(height: 5),
                // Weight
                InputField(
                  icon: Icons.monitor_weight,
                  label: "Weight",
                  controller: weight,
                  inputType: TextInputType.number,
                  inputFormat: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) => provider.weightValidator(value),
                ),
                SizedBox(height: 5),
                // Blood Type
                InputField(
                  icon: Icons.bloodtype,
                  label: "Blood Type",
                  controller: bloodType,
                  inputType: TextInputType.text,
                  validator: (value) => provider.validator(value, "Blood Type is Required"),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    elevation: 0,
                    color: Color(0xffC31C2B),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Navbar()));
                      } else {
                        provider.showSnackBar("Fill the Form", context);
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Reservation",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
