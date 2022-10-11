import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../../pages/profileedit/education/model/educationmodel.dart';


class ApiserviceEducationlevels {
  // **************************** Education levels ****************************//

  Future<List<EducationLevel>?> educationLevelsGetFunction() async {
    try {
      final response = await Dio().get(
        'http://10.0.2.2:8000/api/education_level/',
        options: Options(
          headers: <String, String>{
            "Content-Type": "application/json",
          },
        ),
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log("success man we got it");
      } else {
        log('error');
      }
    } on DioError catch (e) {
      if (e.error.toString().contains('SocketException')) {
        log("Connection refused !");
        return null;
      } else {
        log(e.message.toString());
      }
    }
    return null;
  }
}
