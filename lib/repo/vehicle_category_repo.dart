import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:rent_and_ride/models/category.dart';
import 'package:rent_and_ride/utils/apis.dart';

import '../utils/storage_helper.dart';

class VehicleCategoryRepo {
  static Future<void> getAllVehicleCategory(
      {required Function(List<VehicleCategory>) onSuccess,
      required Function(String message) onError}) async {
    try {
      log("on sucess ma aayo ");
      var token = StorageHelper.getToken();
      var url = Uri.parse(RentAndRideApis.category);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType} ${token.accessToken!}"
      };
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      var data = json.decode(response.body);

      print(data.toString());
      if (data['status']) {
        log("on sucess ma aayo ");

        onSuccess(categoryListFromJson(data['data']['categories']));
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
