import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:rent_and_ride/utils/storage_keys.dart';

import '../models/auth/access_token.dart';
import '../models/auth/user_model.dart';

class StorageHelper {
  static DateTime? getAppLoadedDate() {
    try {
      final box = GetStorage();
      var fetchedDate = box.read(StorageKeys.APP_LOAD_DATE);
      if (fetchedDate != null) {
        DateTime dateTime = DateTime.parse(fetchedDate);
        return dateTime;
      } else {
        return null;
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return null;
    }
  }

  static Accesstoken? getToken() {
    try {
      final box = GetStorage();
      Accesstoken token =
          Accesstoken.fromJson(jsonDecode(box.read(StorageKeys.ACCESS_TOKEN)));
      return token;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static User? getUser() {
    try {
      final box = GetStorage();
      User user = User.fromJson(json.decode(box.read(StorageKeys.USER)));
      return user;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return null;
    }
  }
}
