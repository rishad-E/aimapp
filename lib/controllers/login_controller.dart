import 'package:aimshala/services/login_service/login_service.dart';
import 'package:aimshala/services/otp_service/otp_service.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/view/home/home.dart';
import 'package:aimshala/view/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  final GlobalKey<FormState> otpFormKey = GlobalKey();
  RxString validationMessage = ''.obs;
  RxBool isButtonEnabled = false.obs;
    // RxBool onchange = false.obs;
  Rx<Color> buttonColor = Rx<Color>(bbColor);
  Rx<Color> buttonTextColor = Rx<Color>(Colors.black.withOpacity(0.6));
  RxInt filledOtpFields = RxInt(0);

/*---------- sending OTP to Mobile Number ---------*/
  Future<void> sendOTPFunction({required String mobileNo}) async {
    OtpService().sendOTP(mobileNo: mobileNo);
    clearotpControllers();
  }

/*---------- verify OTP ---------*/
  Future<void> verifyOTPFunction({required String mobileNo, required String otp}) async {
    OtpService().validateOTP(mobileNo: '91$mobileNo', otp: otp).then((value) =>
        {
          if (value == true)
            {
              LoginService()
                  .verifyUserExist(mobileNo: mobileNo)
                  .then((value) => {
                        if (value == true)
                          {Get.offAll(() => const HomeScreen())}
                        else
                          {Get.offAll(() => SignUpScreen(mobileNo: mobileNo))}
                      })
            }
          else
            {validationMessage.value = 'Please enter valid code'}
        });
    // isLoading = false;
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
    if (word == null || word.isEmpty || word.length < 10 || word.length > 10) {
      return 'Please enter a Valid Mobile Number';
    }
    return null;
  }

  String validateOtp() {
    String otp = otpController1.text +
        otpController2.text +
        otpController3.text +
        otpController4.text;
    if (otp.isEmpty || otp.length < 4) {
      validationMessage.value = 'Please enter valid code';
      return 'Please enter valid code';
    } else {
      validationMessage.value = '';
      return '';
    }
  }

  void updateButtonColor() {
    int numberOfFilledFields = 0;

    if (otpController1.text.isNotEmpty) numberOfFilledFields++;
    if (otpController2.text.isNotEmpty) numberOfFilledFields++;
    if (otpController3.text.isNotEmpty) numberOfFilledFields++;
    if (otpController4.text.isNotEmpty) numberOfFilledFields++;

    filledOtpFields.value = numberOfFilledFields;

    buttonColor.value = numberOfFilledFields == 4 ? kpurple : bbColor;
    buttonTextColor.value =
        numberOfFilledFields == 4 ? Colors.white : Colors.black;
    // onchange.value = true;

    update(['button-otp']);
  }

  clearotpControllers() {
    otpController1.clear();
    otpController2.clear();
    otpController3.clear();
    otpController4.clear();
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
