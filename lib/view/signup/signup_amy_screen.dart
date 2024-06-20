import 'dart:developer';

import 'package:aimshala/controllers/signup_amy_controller.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/chatbot/widgets/amy_radial_gradient.dart';
import 'package:aimshala/view/signup/widget/amy_signup_widget.dart';
import 'package:aimshala/view/signup/widget/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpAmyScreen extends StatelessWidget {
  final String name;
  final String email;
  const SignUpAmyScreen({super.key, required this.name, required this.email});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmySignUpController(name, email));
    return Scaffold(
      appBar: signupAmyAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 30),
              child: Align(
                alignment: Alignment.topCenter,
                child: AmyBotRadialColor(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => ListView.builder(
                    controller: controller.scrollController,
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: controller.msgs.length,
                    itemBuilder: (context, index) {
                      final data = controller.msgs[index];
                      if (controller.isTyping && index == 0) {
                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: sendcardSignup(
                                  context, data.message, data.time),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: replaycardSignup(
                                  context, 'Typing...', data.time,
                                  type: true),
                            ),
                          ],
                        );
                      } else {
                        return data.isSender
                            ? sendcardSignup(context, data.message, data.time)
                            : replaycardSignup(
                                context, data.message, data.time);
                      }
                    },
                  ),
                ),
              ),
            ),
            GetBuilder<AmySignUpController>(
              id: 'send-to-amy',
              builder: (c) {
                return Row(
                  children: [
                    Expanded(
                      child: amySignupTextfield(
                        child: c.isAskingGender
                            ? Container(
                                // color: Colors.yellow,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                // height: 30,
                                child: Row(
                                  children: List.generate(
                                    c.genders.length,
                                    (index) => InkWell(
                                      onTap: () {
                                        log(c.genders[index]);
                                        c.chatController.text = c.genders[index];
                                        c.sendMessage(context);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 5),
                                        margin: const EdgeInsets.only(right: 7),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Text(c.genders[index]),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : TextFormField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                controller: c.chatController,
                                keyboardType: c.isAskingDOB
                                    ? TextInputType.number
                                    : TextInputType.text,
                                inputFormatters:
                                    c.isAskingDOB ? [DateInputFormatter()] : [],
                                textInputAction: TextInputAction.send,
                                style: const TextStyle(fontSize: 13),
                                decoration: amyTextfieldDecor(
                                    isAskingDOB: c.isAskingDOB),
                                onFieldSubmitted: (value) {
                                  c.sendMessage(context);
                                },
                              ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (c.chatController.text.isNotEmpty) {
                          c.sendMessage(context);
                        }
                      },
                      child: c.isAskingGender ? shrinked : sendMsgContainer(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
