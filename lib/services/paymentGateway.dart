import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentGateway extends GetxController {
  Razorpay razorpay = Razorpay();

  @override
  void onInit() {
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handleSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handleError);
    super.onInit();
  }

  void handleError(PaymentFailureResponse paymentFailureResponse) {
    Get.snackbar('Error Occured', paymentFailureResponse.message);
  }

  void handleSuccess(PaymentSuccessResponse paymentSuccessResponse) {
    Get.snackbar('Error Occured', paymentSuccessResponse.orderId);
  }

  void handlerExternalWallet(ExternalWalletResponse externalWalletResponse) {
    Get.snackbar('Error Occured', externalWalletResponse.walletName);
  }

  void dispatchPayment(
      {String amount,
      String name,
      String email,
      String wallet,
      String contact}) {
    var options = {
      'key': 'rzp_test_RjNbEg8cd67U8T',
      'amount': num.parse(amount) * 100,
      'name': name,
      'description': 'description',
      'prefill': {'contact': contact, 'email': email},
      'external': {
        'wallet': [wallet]
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }
}
