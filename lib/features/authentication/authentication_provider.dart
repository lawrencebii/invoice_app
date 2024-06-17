import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/features/authentication/views/login_page.dart';
import 'package:invoice_app/utils/constants.dart';
import 'package:invoice_app/utils/generic_http_helpers.dart';
import 'package:invoice_app/utils/petite_storage.dart';
import 'package:invoice_app/utils/urls.dart';

import '../navigation/views/navigation.dart';

class LocalAuthenticationProvider extends ChangeNotifier {
  dynamic _errorMessage;
  get errorMessage => _errorMessage;
  GenericService _service = GenericService();
  setErrorMessage(val) {
    _errorMessage = val;

    notifyListeners();
  }

  bool _loading = false;
  get loading => _loading;
  void setIsloading(val) {
    _loading = val;
    notifyListeners();
  }

  void signUp(context) async {
    setIsloading(true);
    try {
      var userData = {
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "phone": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "password_confirmation": passwordController.text.trim(),
        "address": addressController.text.trim(),
      };
      var res = await _service.postRequest(
          endpoint: "${basicUrl}api/register",
          body: userData,
          context: context);
      log(res.toString());
      if (res['status'].toString() == "200" ||
          res['status'].toString() == '201') {
        StorageUtil.putString(
            key: 'user', value: jsonEncode(res['data']['user']));
        StorageUtil.putString(key: 'token', value: res['data']['token']);
        setIsloading(false);
        showSnack(context, "Account Created Successfully");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Navigation()));
      }
    } catch (e) {
      setIsloading(false);
    }
  }

  void loginUser(context) async {
    try {
      setIsloading(true);
      var userData = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      var res = await _service.postRequest(
          endpoint: "${basicUrl}api/login", body: userData, context: context);

      setIsloading(false);

      if (res['status'].toString() == '200') {
        StorageUtil.putString(
            key: 'user', value: jsonEncode(res['data']['user']));
        StorageUtil.putString(key: 'token', value: res['data']['token']);

        showSnack(context, "Successfully Logged in ");
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Navigation()));
      } else {
        showSnack(context, "Failed to log in ${res['data']}");
      }
    } catch (e) {
      setIsloading(false);
      print("has error $e");

      setErrorMessage(e.toString());
    }
  }

  void logout(context) async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
    StorageUtil.logout();
  }

//   TextEditingControllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
