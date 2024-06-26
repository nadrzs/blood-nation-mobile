import 'package:blood_nation/components/widgets/input_field.dart';
import 'package:blood_nation/pages/success_page.dart';
import 'package:blood_nation/provider/add_reservation_provider.dart';
import 'package:blood_nation/provider/headers_reservation.dart';
import 'package:blood_nation/provider/validation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReservationPage extends StatefulWidget {
  final String eventId;

  const ReservationPage({super.key, required this.eventId});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final address = TextEditingController();
  final age = TextEditingController();
  final weight = TextEditingController();
  final bloodType = TextEditingController();

  final provider = ValidationProvider();
  final formKey = GlobalKey<FormState>();

  String? idUser;

  _stateToken() async {
    idUser = await HeadersReservation.userId();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _stateToken();
  }

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
                SizedBox(height: 40),
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
                  validator: (value) =>
                      provider.validator(value, "Address is Required"),
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
                  validator: (value) => provider.bloodTypeValidator(value),
                ),
                SizedBox(height: 100),
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
                          final reservation = await AddReservation()
                              .addReservationUser(
                                  address.text,
                                  age.text,
                                  weight.text,
                                  bloodType.text,
                                  widget.eventId,
                                  idUser!);
                          print(reservation);

                          if (reservation != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuccessPage()));
                          }
                        } catch (e) {
                          provider.showSnackBar(
                              "Failed to register reservation", context);
                        }
                      } else {
                        provider.showSnackBar(
                            "Please fill in all fields", context);
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
