import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:second_project/pages/login_page/model/loginmodel.dart';
import 'package:second_project/service/user_services/user_services.dart';

class Apiservicelogin {
  // **************************** login ****************************//

  Future loginpostfunction(context, Loginmodel object) async {
    try {
      final response = await Dio().post('http://10.0.2.2:8000/api/user/login/',
          data: object.tojson(),
          options: Options(headers: <String, String>{
            "Content-Type": "application/json",
          }));
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        UserServices().setUserData(response.data["token"]["access"]);
        return "success";
      } else {
        log('error');
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        padding: const EdgeInsets.all(20),
        backgroundColor: Colors.red,
        content: Text(
          e.response!.data.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ));
      if (e.error.toString().contains('SocketException')) {
        log("Connection refused !");
        return;
      } else {
        log(e.message.toString());
      }
    }
  }
}
