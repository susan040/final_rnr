import 'dart:convert';
import 'dart:developer';

import '../models/on_going_order.dart';
import '../models/order.dart';
import '../utils/apis.dart';
import '../utils/storage_helper.dart';

import 'package:http/http.dart' as http;

class RecentOrderRepo {
  static Future<void> getAllRecentOrder(
      {required Function(List<Order>) onSuccess,
      required Function(String message) onError}) async {
    try {
      var token = StorageHelper.getToken();
      var url = Uri.parse(RentAndRideApis.recentOrder);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType!} ${token.accessToken!}"
      };
      http.Response response = await http.get(
        url,
        headers: headers,
      );
      var data = json.decode(response.body);

      if (data['status']) {
        onSuccess(orderListFromJson(data['data']));
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }

  static Future<void> getOnGoing(
      {required Function(List<OnGoingOrder>) onSuccess,
      required Function(String message) onError}) async {
    // try {
    print("get hgoing on going");
    var token = StorageHelper.getToken();
    var url = Uri.parse(RentAndRideApis.onGoing);
    var headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "${token!.tokenType!} ${token.accessToken!}"
    };
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    var data = json.decode(response.body);
    print("$data");
    if (data['status']) {
      onSuccess(onGoingListFromJson(data['data']));
    } else {
      onError(data['message']);
    }
    // } catch (e) {
    //   log("-->>>>$e");
    //   onError("Sorry something went wrong. Please try again");
    // }
  }
}
