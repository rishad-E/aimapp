import 'dart:developer';
import 'package:aimshala/models/amy_register_model/amy_register_model.dart';
import 'package:aimshala/services/signup_service/amy_signup_service.dart';
import 'package:aimshala/view/signup/widget/amy_signup_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AmySignUpController extends GetxController {
  final String name;
  final String email;
  final String uId;
  AmySignUpController(this.name, this.email, this.uId);
  TextEditingController chatController = TextEditingController();
  TextEditingController otherOptionController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxList<ChatMessageSignup> msgs = <ChatMessageSignup>[].obs;
  bool isTyping = false;
  bool isAskingDOB = false;
  bool isAskingGender = false;
  int qusId = 0;
  bool skipQuestion = false;

  List<Option> otherOptionList = [];
  List<String> genderOptionList = [];

  @override
  void onInit() {
    addDefaultMessage();
    super.onInit();
  }

  void addDefaultMessage() async {
    DateTime time = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(time);
    Map<String, dynamic>? res = await AmySignUpService()
        .sendToAmyRegister(uId: uId, msg: 'hai', qusId: '019');
    if (res != null) {
      qusId = int.tryParse(res["upd_ques_index"])!;
      String resMsg = res["bot_reply"];
      List<String> msgParts = resMsg.split('#');
      // Add each part of the message to msgs
      // Add each part of the message to msgs in reverse order
      for (int i = msgParts.length - 1; i >= 0; i--) {
        String part = msgParts[i];
        if (part.trim().isNotEmpty) {
          if (i == msgParts.length - 1) {
            msgs.add(ChatMessageSignup(false, part, currentTime, false));
          } else if (i == 0) {
            msgs.add(ChatMessageSignup(false, part, 'no', true));
          } else {
            msgs.add(ChatMessageSignup(false, part, 'no', false));
          }
        }
      }

      isAskingDOB = true;
      update(['send-to-amy']);
    }
  }

  void sendMessage(BuildContext context) async {
    DateTime time = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(time);
    String userMessage = chatController.text;
    String otheroptionMsg = otherOptionController.text;
    chatController.clear();

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
        qusId = res["upd_ques_index"];
        String resMsg = res["bot_reply"];
        log("question=>$resMsg   qusid=>$qusId", name: 'controller res amy');
        if (qusId == 1) {
          genderOptionList.clear();
          List<dynamic> resOption = res["options"];
          genderOptionList.addAll(resOption.cast<String>());
        } else {
          otherOptionList.clear();
          log("otheroptionlist=>$otherOptionList", name: 'checkkkkkkk option');
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
    update(['send-to-amy']);
  }

  bool isValidDOB(String dob) {
    // Add validation logic for DOB format (DD/MM/YYYY)
    return RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(dob);
  }
}
