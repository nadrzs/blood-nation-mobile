import 'package:flutter/material.dart';

class ValidationProvider extends ChangeNotifier {
  bool _isVisible = false;
  bool get isVisible => _isVisible;

  RegExp strongPassword =
      RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&*~]).{8,}$');

  RegExp emailRequirement = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // Text Validation
  validator(String value, String message) {
    if (value.isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  // Email Validation
  emailValidator(String value) {
    if (value.isEmpty) {
      return "Email must contain @";
    } else if (!emailRequirement.hasMatch(value)) {
      return "Email is not valid";
    } else {
      return null;
    }
  }

  // Password Validation
  passwordValidator(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (strongPassword.hasMatch(value)) {
      return "Password is not strong enough";
    } else {
      return null;
    }
  }

  // Show and Hide Password
  void showHidePassword() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  // Phone Number Validation
  phoneValidator(String value) {
    if (value.isEmpty) {
      return "Phone Number must be a number (0123456789)";
    } else if (value.length < 11) {
      return "Phone Number is Not Valid";
    } else {
      return null;
    }
  }

  // Age Validator
  ageValidator(String value) {
    if (value.isEmpty) {
      return "Age is Required";
    } else {
      return null;
    }
  }

  // Weight Validator
  weightValidator(String value) {
    if (value.isEmpty) {
      return "Weight is Required";
    } else {
      return null;
    }
  }

  // Blood Type Validator
  bloodTypeValidator(String value) {
    if (value.isEmpty) {
      return "Blood Type is Required";
    } else if (value != 'A' && value != 'B' && value != 'AB' && value != 'O') {
      return "Blood Type is not valid";
    } else {
      return null;
    }
  }

  // Snackbar Message
  showSnackBar(String message, context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
