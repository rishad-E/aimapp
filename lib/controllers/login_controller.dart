import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/services/login_service/login_service.dart';
import 'package:aimshala/services/otp_service/otp_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/view/login/otp_screen.dart';
import 'package:aimshala/view/signup/signup_amy_screen.dart';
import 'package:aimshala/view/signup/signup_screen.dart';
import 'package:aimshala/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final storage = const FlutterSecureStorage();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  RxString validationMessage = ''.obs;
  RxBool isButtonEnabled = false.obs;
  RxBool otpVerified = false.obs;
  UserModel? userData;
  Rx<Color> buttonColor = Rx<Color>(const Color.fromARGB(255, 244, 244, 244));
  Rx<Color> buttonTextColor = Rx<Color>(Colors.black.withOpacity(0.6));

  // @override
  // onInit() {
  //   update(['continue-button']);
  //   update(['button-otp']);
  //   super.onInit();
  // }

/*---------- sending OTP to Mobile Number ---------*/
  Future<void> sendOTPFunction({required String mobileNo}) async {
    // log('message');
    String? res = await OtpService().sendOTP(mobileNo: mobileNo);
    if (res == 'success') {
      Get.to(() => OTPScreen(mobileNo: mobileNo));
    } else {
      Get.showSnackbar(
        GetSnackBar(
          snackStyle: SnackStyle.FLOATING,
          message: res,
          margin: const EdgeInsets.all(10),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
    clearotpControllers();
  }

/*---------- verify OTP ---------*/
  Future<void> verifyOTPFunction(
      {required String mobileNo, required String otp}) async {
    otpVerified.value = true;
    String? val = await OtpService().validateOTP(otp: otp, mobileNo: mobileNo);
    if (val == 'OTP verified success') {
      String mobileWithoutCountryCode = mobileNo.substring(2);
      storage.write(key: 'phone', value: mobileWithoutCountryCode);
      Map<String, dynamic>? res = await LoginService()
          .verifyUserExist(mobileNo: mobileWithoutCountryCode);
      if (res != null) {
        if (res.containsKey('status')) {
          storage.write(key: 'phone', value: mobileWithoutCountryCode);
          Get.offAll(() => const SplashScreen());
        } else if (res.containsKey('error')) {
          String errorMessage = res["error"];
          if (errorMessage == "Please fill first three questions.") {
            User? user = User.fromJson(res["user"]);
            String? id = user.id.toString();
            String? name = user.name.toString();
            String? email = user.email.toString();
            String? phone = user.phone.toString();
            storage.write(key: 'email', value: email);
            // log('name=>$name email=>$email id=>$id');
            Get.offAll(() => SignUpAmyScreen(
                name: name, email: email, uId: id, phone: phone));
          } else {
            storage.write(key: 'phone', value: mobileWithoutCountryCode);
            Get.offAll(() => SignUpScreen(mobileNo: mobileNo));
          }
        } else if (res.containsKey('token')) {
          userData = UserModel.fromJson(res);
          if (userData != null) {
            storage.write(key: 'token', value: userData?.token.toString());
            storage.write(
                key: 'phone', value: userData?.user?.phone.toString());
            storage.write(
                key: 'email', value: userData?.user?.email.toString());
            storage.write(key: 'name', value: userData?.user?.name.toString());
            Get.offAll(() => const SplashScreen());
            phoneController.clear();
          }
        }
      }

      otpVerified.value = false;
    } else {
      otpVerified.value = false;
      validationMessage.value = 'Please enter valid code';
    }
  }

/*---------- Resend OTP ---------*/
  Future<void> resendOTPFunction({required String mobileNo}) async {
    OtpService().resendOTP(mobileNo: mobileNo).then((value) => {
          if (value == 'retry send successfully')
            {
              Get.showSnackbar(
                const GetSnackBar(
                  margin: EdgeInsets.all(10),
                  snackStyle: SnackStyle.FLOATING,
                  message: 'OTP resent successfully',
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              )
            }
          else
            {
              Get.showSnackbar(
                GetSnackBar(
                  snackStyle: SnackStyle.FLOATING,
                  message: value,
                  margin: const EdgeInsets.all(10),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 2),
                ),
              )
            }
        });
  }

/*----------validation message---------*/
  String? phoneValidation(String? word) {
    if (word == null ||
        word.isEmpty ||
        word.length < 10 ||
        word.length > 10 ||
        !word.isNumericOnly) {
      return 'Please enter a Valid Mobile Number';
    }

    return null;
  }

  String validateOtp() {
    if (otpController.text.isEmpty || otpController.text.length < 4) {
      validationMessage.value = 'Please enter valid code';
      return 'Please enter valid code';
    } else {
      validationMessage.value = '';
      return '';
    }
  }

  void updateButtonColor() {
    buttonColor.value = otpController.text.length == 4
        ? kpurple
        : const Color.fromARGB(255, 244, 244, 244);
    buttonTextColor.value = otpController.text.length == 4 ? kwhite : kblack;

    update(['button-otp']);
  }

  clearotpControllers() {
    otpController.clear();
  }

  // @override
  // void dispose() {
  //   clearController();
  //   super.dispose();
  // }
}
