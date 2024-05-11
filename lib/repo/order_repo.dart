import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:rent_and_ride/models/order.dart';
import '../utils/apis.dart';
import '../utils/storage_helper.dart';

class OrderRepo {
  static Future<void> addOrder(
      {String? tnxid,
      String? amount,
      required String startDate,
      required String endDate,
      required String paymentMethod,
      required String orderTime,
      required int vendorId,
      required int vehicleId,
      required int quantity,
      required int totalPrice,
      required Function() onSuccess,
      required Function(String message) onError}) async {
    try {
      var token = StorageHelper.getToken();
      var url = Uri.parse(RentAndRideApis.postOrder);
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "${token!.tokenType!} ${token.accessToken!}"
      };
      var body = json.encode({
        "start_date": startDate,
        "end_date": endDate,
        "order_time": orderTime,
        "vendor_id": vendorId,
        "total_price": totalPrice,
        "quantity": quantity,
        "vehicle_id": vehicleId,
        "payment_method": paymentMethod,
        "transaction_id": tnxid,
        "amount": amount,
      });

      // print(body);

      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      var data = json.decode(response.body);
      print(data);
      if (data['status']) {
        log("on sucess ma aayo ");
        onSuccess();
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log("-->>>>$e");
      onError("Sorry something went wrong. Please try again");
    }
  }

  static Future<void> getAllOrders(
      {String? orderType,
      String? dateFilter,
      required Function(List<Order>) onSuccess,
      required Function(String message) onError}) async {
    // try {
    var token = StorageHelper.getToken();
    var baseurl;
    if (orderType == "All" && dateFilter == "Any") {
      baseurl = RentAndRideApis.viewOrder;
    } else if (orderType != "All" && dateFilter == "Any") {
      baseurl = "${RentAndRideApis.viewOrder}?order_status=$orderType";
    } else if (orderType == "All" && dateFilter != "Any") {
      baseurl = "${RentAndRideApis.viewOrder}?date_type=$dateFilter";
    } else {
      baseurl =
          "${RentAndRideApis.viewOrder}?date_type=$dateFilter&order_status=$orderType";
    }

    var url = Uri.parse(baseurl);
    print(url);

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
      onSuccess(orderListFromJson(data['data']['orders']));
    } else {
      onError(data['message']);
    }
    // } catch (e) {
    //   log("-->>>>$e");
    //   onError("Sorry something went wrong. Please try again");
    // }
  }

  static Future<void> cancelBooking({
    required String orderId,
    required Function(String message) onSuccess,
    required Function(String message) onError,
  }) async {
    // try {
    String url = RentAndRideApis.cancelOrder;

    var token = StorageHelper.getToken();

    var headers = {
      "Accept": "application/json",
      "Authorization": token.toString()
    };

    var body = {
      "order_id": orderId,
    };

    http.Response response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    log("$url ===========>");
    log(response.body);

    dynamic data = json.decode(response.body);

    if (data['status']) {
      onSuccess(data['message']);
    } else {
      onError(data['message']);
    }
    // } catch (e, s) {
    //   log(e.toString());
    //   log(s.toString());
    //   onError("Sorry! something went wrong");
    // }
  }
}
