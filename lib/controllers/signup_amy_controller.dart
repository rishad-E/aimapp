import 'dart:developer';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/models/amy_register_model/amy_register_model.dart';
import 'package:aimshala/services/login_service/login_service.dart';
import 'package:aimshala/services/signup_service/amy_signup_service.dart';
import 'package:aimshala/view/signup/widget/amy_signup_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AmySignUpController extends GetxController {
  final String name;
  final String email;
  final String uId;
  final String phone;
  AmySignUpController(this.name, this.email, this.uId, this.phone);
  TextEditingController chatController = TextEditingController();
  TextEditingController otherOptionController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxList<ChatMessageSignup> msgs = <ChatMessageSignup>[].obs;
  bool isTyping = false;
  bool isAskingDOB = false;
  bool otherSelected = false;
  int qusId = 0;
  bool skipQuestion = false;

  List<Option> otherOptionList = [];
  List<String> genderOptionList = [];

  String? nameSecond;
  String? idSecond;

  final loginC = Get.put(LoginController());

  @override
  void onInit() {
    addDefaultMessage();
    super.onInit();
  }

  void addDefaultMessage() async {
    DateTime time = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(time);
    isTyping = true;
    Map<String, dynamic>? res = await AmySignUpService()
        .sendToAmyRegister(uId: uId, msg: 'hai', qusId: '019');
    if (res != null) {
      qusId = int.tryParse(res["upd_ques_index"])!;
      String resMsg = res["bot_reply"];
      List<String> msgParts = resMsg.split('#');
      for (int i = 0; i < msgParts.length; i++) {
        String part = msgParts[i];
        if (part.trim().isNotEmpty) {
          if (i == msgParts.length - 1) {
            msgs.insert(0, ChatMessageSignup(false, part, currentTime, false));
          } else if (i == 0) {
            msgs.insert(0, ChatMessageSignup(false, part, 'no', true));
          } else {
            msgs.insert(0, ChatMessageSignup(false, part, 'no', false));
          }
        }
      }
      isTyping = false;
      update(['send-to-amy']);
    }
    isAskingDOB = true;
  }

  void sendMessage(BuildContext context) async {
    DateTime time = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(time);
    String userMessage = chatController.text;
    String otheroptionMsg = otherOptionController.text;
    chatController.clear();
    log(userMessage, name: 'usermsg');
    otherSelected = false;
    log(otherSelected.toString(), name: 'other selected');
    if (userMessage.isNotEmpty) {
      if (qusId > 1) {
        msgs.insert(
            0, ChatMessageSignup(true, otheroptionMsg, currentTime, false));
      } else {
        msgs.insert(
            0, ChatMessageSignup(true, userMessage, currentTime, false));
      }
      isTyping = false;
      scrollController.animateTo(0.0,
          duration: const Duration(seconds: 1), curve: Curves.easeOut);
      if (isAskingDOB && isValidDOB(userMessage)) {
        isAskingDOB = false;
        FocusScope.of(context).unfocus();
      }
      isTyping = true;
      Map<String, dynamic>? res = await AmySignUpService().sendToAmyRegister(
          uId: uId, msg: userMessage, qusId: qusId.toString());
      if (res != null) {
        if (res.containsKey('errors')) {
          String errorMessage = res['errors']['msg.valid']?.join(', ') ?? '';
          log(errorMessage);
          if (errorMessage.contains('Please specify')) {
            otherSelected = true;
            msgs.insert(0,
                ChatMessageSignup(false, 'Please specify', currentTime, true));
          }
        } else {
          qusId = res["upd_ques_index"];
          String resMsg = res["bot_reply"];
          log("question=>$resMsg   qusid=>$qusId", name: 'controller res amy');
          if (qusId == 1) {
            genderOptionList.clear();
            List<dynamic> resOption = res["options"];
            genderOptionList.addAll(resOption.cast<String>());
          } else {
            otherOptionList.clear();
            log("otheroptionlist=>$otherOptionList",
                name: 'checkkkkkkk option');
            List<Option> list = [];
            if (res["options"] is Map) {
              Map<String, dynamic> data = res['options'];
              data.forEach((key, value) {
                list.add(Option(id: int.tryParse(key), item: value));
              });
            } else if (res["options"] is List) {
              List<dynamic> data = res["options"];
              for (int i = 0; i < data.length; i++) {
                list.add(Option(id: i, item: data[i]));
              }
            }
            otherOptionList.addAll(list);
            log("items=>$otherOptionList", name: 'checkkkkkkk option');
          }
          List<String> parts = resMsg.split('#');

          for (int i = 0; i < parts.length; i++) {
            String part = parts[i].trim();
            if (part.isNotEmpty) {
              if (i == part.length - 1) {
                msgs.insert(
                    0, ChatMessageSignup(false, part, currentTime, false));
              } else if (i == 0) {
                msgs.insert(0, ChatMessageSignup(false, part, 'no', true));
              } else {
                msgs.insert(0, ChatMessageSignup(false, part, 'no', false));
              }
            }
          }
          isTyping = false;
          update(['send-to-amy']);
          if (qusId > 3 && qusId < 15) {
            Map<String, dynamic>? resData =
                await LoginService().verifyUserExist(mobileNo: phone);
            if (resData != null) {
              if (resData.containsKey('token')) {
                loginC.userData = UserModel.fromJson(resData);
                if (loginC.userData != null) {
                  String? id = loginC.userData?.user?.id.toString();
                  String? uName = loginC.userData?.user?.name.toString();
                  log('userID=>$id  name=>$uName', name: 'userid and username');
                }
              }
            }
            update(['send-to-amy']);
          }
        }

        scrollController.animateTo(0.0,
            duration: const Duration(seconds: 1), curve: Curves.easeOut);
        isTyping = false;
        update(['send-to-amy']);
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            snackStyle: SnackStyle.FLOATING,
            message: 'Some error occurred, please try again!',
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
    // final UserModel? userData = Get.put(LoginController()).userData;
    // if (userData != null) {
    //   nameSecond = userData.user?.name ?? '';
    //   idSecond = userData.user?.id.toString();
    //   log('userID=>$idSecond  name=>$nameSecond', name: 'userid and username');
    // }
    update(['send-to-amy']);
  }

  bool isValidDOB(String dob) {
    // Add validation logic for DOB format (DD/MM/YYYY)
    return RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(dob);
  }
}
