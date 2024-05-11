import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:rent_and_ride/models/vehicle.dart';
import '../utils/apis.dart';
import '../utils/storage_helper.dart';

class VehicleRepo {
  static Future<void> getAllVehicle(
      {String? sortType,
      var categoryIds,
      required String startDate,
      required String endDate,
      required Function(List<Vehicle>) onSuccess,
      required Function(String message) onError}) async {
    try {
      log("--------$categoryIds");
      log("----sort by $sortType");
      var token = StorageHelper.getToken();
      var url = Uri.parse(RentAndRideApis.availableVehicle);
      log("${token!.tokenType!} ${token.accessToken!}");

      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token.tokenType!} ${token.accessToken!}"
      };

      if (categoryIds == [] || categoryIds.length == 0 || categoryIds == null) {
        categoryIds = "all";
      }

      var body;

      if (sortType == "Any" && categoryIds == "all") {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
        });
      } else if (sortType != "Any" && categoryIds == "all") {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
          "sort_type": sortType,
        });
      } else if (sortType == "Any" && categoryIds != "all") {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
          "category_id": categoryIds,
        });
      } else {
        body = json.encode({
          "start_date": startDate,
          "end_date": endDate,
          "category_id": categoryIds,
          "sort_type": sortType,
        });
      }
      log(body.toString());

      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      var data = json.decode(response.body);

      if (data['status']) {
        onSuccess(vehicleListFromJson(data['data']));
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }
}
