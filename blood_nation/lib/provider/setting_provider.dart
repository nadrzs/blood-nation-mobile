import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
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
      return "Email is required";
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
      return "Phone Number is Required";
    } else if (value.length < 14) {
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

  // Snackbar Message
  showSnackBar(String message, context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
