import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:rent_and_ride/models/otp.dart';
import 'package:rent_and_ride/utils/apis.dart';

import '../utils/http_request.dart';

class ForgetPasswordRepo {
  static Future<void> forgetPassword({
    required String email,
    required Function(OtpMail) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        // "Content-Type": "application/json",
      };

      var body = {
        "email": email,
      };

      http.Response response = await HttpRequestHamroSadhan.post(
          Uri.parse(
            RentAndRideApis.forgotPassword,
          ),
          headers: headers,
          body: body);

      // log(json.encode(body));
      // log(response.body);

      dynamic data = jsonDecode(response.body);
      print(data);
      if (data["success"] as bool) {
        OtpMail otpCustomer = OtpMail.fromJson(data["data"]);

        onSuccess(otpCustomer);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }

  static Future<void> resetPassword({
    required String otp,
    required String password,
    required String id,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        // "Content-Type": "application/json",
      };
      var body = {
        "customer_id": id,
        "otp": otp,
        "new_password": password,
      };
      print(body);

      http.Response response = await http.post(
        Uri.parse(RentAndRideApis.resetPasswordUrl),
        headers: headers,
        body: body,
      );

      print(json.encode(body));
      print(response.body);

      dynamic data = jsonDecode(response.body);
      if (data["success"]) {
        onSuccess(data['message']);
      } else {
        onError(data["message"]);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      onError("Sorry something went wrong");
    }
  }
}
