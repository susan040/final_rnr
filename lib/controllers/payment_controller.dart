import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  var token = "".obs;
  var amount = 0.obs;

  void postPayment() async {
    const String url = "http://hs.test/api/khalti/payment/verify";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "token": token.value,
          "amount": amount.value.toString(),
        },
        
      );
      
      print(token.value);
      print(response.body);
    } catch (e) {
      Future.error(e);
    }
  }
}
