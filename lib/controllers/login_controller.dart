import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/services/login_service/login_service.dart';
import 'package:aimshala/services/otp_service/otp_service.dart';
import 'package:aimshala/utils/common/colors_common.dart';
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
  UserDataModel? userData;
  Rx<Color> buttonColor = Rx<Color>(bbColor);
  Rx<Color> buttonTextColor = Rx<Color>(Colors.black.withOpacity(0.6));

/*---------- sending OTP to Mobile Number ---------*/
  Future<void> sendOTPFunction({required String mobileNo}) async {
    OtpService().sendOTP(mobileNo: mobileNo);
    clearotpControllers();
  }

/*---------- verify OTP ---------*/
  Future<void> verifyOTPFunction(
      {required String mobileNo, required String otp}) async {
    bool? val = await OtpService().validateOTP(otp: otp, mobileNo: mobileNo);
    if (val == true) {
      String mobileWithoutCountryCode = mobileNo.substring(2);
      userData = await LoginService()
          .verifyUserExist(mobileNo: mobileWithoutCountryCode);
      if (userData?.token != null) {
        storage.write(key: 'token', value: userData?.token.toString());
        storage.write(key: 'phone', value: userData?.user?.phone.toString());
        Get.offAll(() => const SplashScreen());
        phoneController.clear();
      } else {
        Get.offAll(() => SignUpScreen(mobileNo: mobileNo));
      }
    } else {
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
    // int numberOfFilledFields = 0;

    // if (otpController1.text.isNotEmpty) numberOfFilledFields++;
    // if (otpController2.text.isNotEmpty) numberOfFilledFields++;
    // if (otpController3.text.isNotEmpty) numberOfFilledFields++;
    // if (otpController4.text.isNotEmpty) numberOfFilledFields++;

    // filledOtpFields.value = numberOfFilledFields;

    // buttonColor.value = numberOfFilledFields == 4 ? kpurple : bbColor;
    // buttonTextColor.value =
    //     numberOfFilledFields == 4 ? Colors.white : Colors.black;

    buttonColor.value = otpController.text.length == 4 ? kpurple : bbColor;
    buttonTextColor.value = otpController.text.length == 4 ? kwhite : kblack;

    update(['button-otp']);
  }

  clearotpControllers() {
    otpController.clear();
    // otpController2.clear();
    // otpController3.clear();
    // otpController4.clear();
  }

  // @override
  // void dispose() {
  //   phoneController.dispose();
  //   otpController1.dispose();
  //   otpController2.dispose();
  //   otpController3.dispose();
  //   otpController4.dispose();

  //   super.dispose();
  // }
}





  // OtpService().validateOTP(mobileNo: '91$mobileNo', otp: otp).then(
    //       (value) => {
    //         if (value == true)
    //           {
    //             LoginService()
    //                 .verifyUserExist(mobileNo: mobileNo)
    //                 .then((value) => {
    //                       if (value?.token != null)
    //                         {Get.offAll(() => const HomeScreen())}
    //                       else
    //                         {Get.offAll(() => SignUpScreen(mobileNo: mobileNo))}
    //                     })
    //           }
    //         else
    //           {validationMessage.value = 'Please enter valid code'}
    //       },
    //     );