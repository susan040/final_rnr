import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rent_and_ride/models/auth/user_model.dart';
import '../models/auth/access_token.dart';
import '../utils/apis.dart';

class AuthRepo {
  static Future<void> loginUser({
    required String email,
    required String password,
    required Function(User user, Accesstoken token) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var body = json.encode({
        "email": email,
        "password": password,
      });
      http.Response response = await http.post(
          Uri.parse(
            RentAndRideApis.login,
          ),
          headers: headers,
          body: body);

      dynamic data = jsonDecode(response.body);

      if (data["status"]) {
        Accesstoken token = Accesstoken.fromJson(data["data"]["token"]);
        User user = User.fromJson(data["data"]["user"]);
        onSuccess(user, token);
      } else {
        onError(data["message"]);
      }
    } catch (e) {
      onError("Something went wrong");
    }
  }

  static Future<void> registerUser({
    required User user,
    required String password,
    required Function(User user, Accesstoken token) onSuccess,
    required Function(String) onError,
  }) async {
    print("hello world");
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      var body = json.encode({
        "email": user.email,
        "password": password,
        'phone_number': user.phoneNumber,
        'name': user.name,
        'type': 'user',
      });

      http.Response response = await http.post(
          Uri.parse(
            RentAndRideApis.register,
          ),
          headers: headers,
          body: body);
      print(response.body);
      dynamic data = jsonDecode(response.body);
      print(data.toString);
      if (data["status"]) {
        Accesstoken token = Accesstoken.fromJson(data["data"]["token"]);
        User user = User.fromJson(data["data"]["user"]);
        onSuccess(user, token);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      onError("Something went wrong");
    }
  }
}
