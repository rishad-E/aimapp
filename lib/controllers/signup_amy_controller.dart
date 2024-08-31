import 'dart:developer';
import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/models/amy_register_model/amy_register_model.dart';
import 'package:aimshala/services/login_service/login_service.dart';
import 'package:aimshala/services/signup_service/amy_signup_service.dart';
import 'package:aimshala/view/signup/widget/amy_signup_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AmySignUpController extends GetxController {
  final String name;
  final String email;
  final String phone;
  AmySignUpController(this.name, this.email, this.phone);
  TextEditingController chatController = TextEditingController();
  TextEditingController idController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxList<ChatMessageSignup> msgs = <ChatMessageSignup>[].obs;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool isTyping = false;
  // bool isAskingDOB = false;
  bool otherSelected = false;
  int qusId = 0;
  RxBool skipQuestion = false.obs;
  String isMultiSelect = 'single-select';

  List<Option> singleSelecMapList = [];
  List<String> singleSelecList = [];
  List<String> multiselectList = [];
  List<String> checkMulti = [];

  final loginC = Get.put(LoginController());

  @override
  void onInit() {
    addDefaultMessage();
    super.onInit();
  }

  void addDefaultMessage() async {
    String? token = await storage.read(key: 'token');
    DateTime time = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(time);
    // isTyping = true;
    Map<String, dynamic>? res = await AmySignUpService()
        .sendToAmyRegister(token: token.toString(), msg: 'hai', qusId: '019');
    if (res != null) {
      // qusId = int.tryParse(res["upd_ques_index"])!;
      if (res["upd_ques_index"] is int) {
        qusId = res["upd_ques_index"];
      } else if (res["upd_ques_index"] is String) {
        qusId = int.tryParse(res["upd_ques_index"]) ?? 0;
      }
      String resMsg = res["bot_reply"];
      isMultiSelect = res["select_type"];
      //List<Option> list = [];
      singleSelecMapList = [];
      multiselectList = [];
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
      if (res["options"] is Map<String, dynamic>) {
        Map<String, dynamic> data = res['options'];
        data.forEach((key, value) {
          singleSelecMapList.add(Option(id: int.tryParse(key), item: value));
        });
      } else if (res["options"] is List<dynamic>) {
        List<dynamic> data = res["options"];
        for (int i = 0; i < data.length; i++) {
          multiselectList.add(data[i]);
        }
      }
      /* Map<String, dynamic> data = res['options'];
      data.forEach((key, value) {
        list.add(Option(id: int.tryParse(key), item: value));
      });
      singleSelecMapList.addAll(list);
      */
      // isTyping = false;
      update(['send-to-amy']);
    }
    // isAskingDOB = true;
  }

  void sendMessage(BuildContext context) async {
    String? token = await storage.read(key: 'token');
    DateTime time = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(time);
    String optionId = isMultiSelect == 'single-select' || otherSelected
        ? idController.text
        : checkMulti.join(', ');
    String userMessage = isMultiSelect == 'single-select'
        ? chatController.text
        : checkMulti.join(', ');
    chatController.clear();
    if (userMessage.isNotEmpty || optionId.isNotEmpty) {
      isTyping = false;
      otherSelected
          ? msgs.insert(
              0, ChatMessageSignup(true, optionId, currentTime, true))
          : msgs.insert(
              0, ChatMessageSignup(true, userMessage, currentTime, true));

      scrollController.animateTo(0.0,
          duration: const Duration(seconds: 1), curve: Curves.easeOut);
      log('item=>$userMessage id=>$optionId type=>$isMultiSelect quesId=>$qusId',
          name: 'selected item');

      isTyping = true;
        Map<String, dynamic>? res = await AmySignUpService().sendToAmyRegister(
            token: token.toString(), msg: optionId, qusId: qusId.toString());
        checkMulti.clear();
        if (res != null) {
          if (res.containsKey('errors')) {
            idController.clear();
            isTyping = false;
            otherSelected = true;
            Map<String, dynamic> errors = res['errors'];
            String first = errors.keys.first;
            if (errors[first] is List && (errors[first] as List).isNotEmpty) {
              String errorMessage = errors[first][0].toString();
              // return errorMessage;
              log(errorMessage);
              msgs.insert(
                  0, ChatMessageSignup(false, errorMessage, currentTime, true));
            }
            update(['send-to-amy']);
          } else {
            otherSelected = false;
            singleSelecMapList = [];
            multiselectList = [];
            qusId = res["upd_ques_index"];
            String resMsg = res["bot_reply"];
            isMultiSelect = res["select_type"];
            if (res["options"] is Map<String, dynamic>) {
              Map<String, dynamic> data = res['options'];
              data.forEach((key, value) {
                singleSelecMapList
                    .add(Option(id: int.tryParse(key), item: value));
              });
            } else if (res["options"] is List<dynamic>) {
              List<dynamic> data = res["options"];
              for (int i = 0; i < data.length; i++) {
                multiselectList.add(data[i]);
              }
            }
            List<String> parts = resMsg.split('#');
            for (int i = 0; i < parts.length; i++) {
              String part = parts[i].trim();
              if (part.isNotEmpty) {
                if (i == parts.length - 1) {
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
              verifyUser(phone);
            }
          }
          // update(['send-to-amy']);
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
          msgs.insert(
              0,
              ChatMessageSignup(false, 'Some error occurred, please try again!',
                  currentTime, true));
          isTyping = false;
          update(['send-to-amy']);
        }
    }
  }

  void verifyUser(String phone) async {
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
  }

  void skipTextMessage() {
    DateTime time = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(time);
    String msg =
        '''Please confirm your email by clicking the link we've sent to your inbox.
#Let's Take Charge and Explore your future with Aimshala!''';
    List<String> parts = msg.split('#');
    for (int i = 0; i < parts.length; i++) {
      String part = parts[i].trim();
      if (part.isNotEmpty) {
        if (i == parts.length - 1) {
          msgs.insert(0, ChatMessageSignup(false, part, currentTime, false));
        } else if (i == 0) {
          msgs.insert(0, ChatMessageSignup(false, part, 'no', true));
        } else {
          msgs.insert(0, ChatMessageSignup(false, part, 'no', false));
        }
      }
    }
    skipQuestion.value = true;
    update(['send-to-amy']);
  }

  void allQusSubmittedText() {
    // log(isAllSubmitted.value.toString());
    DateTime time = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(time);
    String msg =
        '''Thank you, $name for taking the time to share your aspirations with me! It's wonderful to learn about your goals and strengths.
#Remember, I am always here to assist you whenever you need guidance. Just look for me in the bottom-left corner of the Aimshala platform.
#Feel free to explore the Aimshala platform and take the ACE Test to get started on your personalized career path. The ACETest will help you understand your strengths and guide you towards the best career choices for you.
#also, Please confirm your email by clicking the link we've sent to your inbox.
#Let's Take Charge and Explore your future with Aimshala! ''';
    List<String> parts = msg.split('#');
    for (int i = 0; i < parts.length; i++) {
      String part = parts[i].trim();
      if (part.isNotEmpty) {
        if (i == parts.length - 1) {
          msgs.insert(0, ChatMessageSignup(false, part, currentTime, false));
        } else if (i == 0) {
          msgs.insert(0, ChatMessageSignup(false, part, 'no', true));
        } else {
          msgs.insert(0, ChatMessageSignup(false, part, 'no', false));
        }
      }
    }
    // isAllSubmitted.value = true;
    // update(['send-to-amy']);
  }

  // bool isValidDOB(String dob) {
  // Add validation logic for DOB format (DD/MM/YYYY)
  // return RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(dob);
  // }
}
