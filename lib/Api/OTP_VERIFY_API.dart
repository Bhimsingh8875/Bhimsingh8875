import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_app/Api/ApiBaseUrl.dart';
import 'package:pet_app/Api/LoginApi.dart';
import 'package:pet_app/Api/SignupApi.dart';
import 'package:pet_app/Prefrence.dart';
import 'package:shared_preferences/shared_preferences.dart';

var lqlmsg;

Future Otp_verify(otp) async {
  var response = await http.post(Uri.parse(Base_URL + OTP_VERIFY), body: {
    'email': signupEmail,
    'otp': otp,
  });

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print("data" + data.toString());

    if (data["status"] == true) {
      print(data["message"].toString());
      print(response.body);

      lqlmsg = data['message'];

      return data;
    } else {
      return Future.error(data["message"]);
    }
  } else {
    return Future.error("Server Error");
  }
}
