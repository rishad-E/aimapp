import 'dart:developer';
import 'package:aimshala/controllers/signup_amy_controller.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/chatbot/widgets/amy_radial_gradient.dart';
import 'package:aimshala/view/signup/widget/amy_signup_widget.dart';
import 'package:aimshala/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpAmyScreen extends StatelessWidget {
  final String name;
  final String email;

  final String phone;
  const SignUpAmyScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.phone});
  @override
  Widget build(BuildContext context) {
    log(' name=>$name email=>$email phone=>$phone', name: 'amy screeeeeeeeen');
    final controller = Get.put(AmySignUpController(name, email, phone));
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
                  () {
                    return ListView.builder(
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
                                    context, 'Typing...', data.time, true,
                                    type: true),
                              ),
                            ],
                          );
                        } else {
                          return data.isSender
                              ? sendcardSignup(context, data.message, data.time)
                              : replaycardSignup(context, data.message,
                                  data.time, data.isFirst);
                        }
                      },
                    );
                    // }
                  },
                ),
              ),
            ),
            GetBuilder<AmySignUpController>(
              id: 'send-to-amy',
              builder: (c) {
                if (c.skipQuestion.value || c.qusId == 17) {
                  return GestureDetector(
                    onTap: () async {
                      c.verifyUser(phone);
                      Get.to(() => const SplashScreen());
                      await Future.delayed(const Duration(seconds: 1));
                      c.skipQuestion.value = false;
                    },
                    child: goHomeContainer(),
                  );
                } else {
                  return Row(
                    children: [
                      Expanded(
                        child: c.otherSelected
                            ? amySignupTextfield(
                                child: TextFormField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: c.idController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.send,
                                  style: const TextStyle(fontSize: 13),
                                  decoration: amyTextfieldDecor(),
                                  onFieldSubmitted: (value) {
                                    log(c.idController.text);
                                    c.sendMessage(context);
                                  },
                                ),
                              )
                            : amySignupTextfield(
                                child: c.multiselectList.isEmpty
                                    ? constrainedOptionContainer(
                                        context,
                                        SingleChildScrollView(
                                          child: Wrap(
                                              spacing: 5,
                                              runSpacing: 5,
                                              children: [
                                                c.qusId == 0
                                                    ? skipText(
                                                        onTap: () =>
                                                            c.skipTextMessage(),
                                                      )
                                                    : shrinked,
                                                ...List.generate(
                                                  c.singleSelecMapList.length,
                                                  (index) {
                                                    final data =
                                                        c.singleSelecMapList[
                                                            index];
                                                    return GestureDetector(
                                                      onTap: () {
                                                        if (c.isMultiSelect ==
                                                            'single-select') {
                                                          c.chatController
                                                                  .text =
                                                              data.item
                                                                  .toString();
                                                          c.idController.text =
                                                              data.id
                                                                  .toString();
                                                          c.sendMessage(
                                                              context);
                                                        } else {
                                                          concateMultiSelect(
                                                              data.item
                                                                  .toString(),
                                                              c);
                                                        }
                                                      },
                                                      child: amyOptionContainer(
                                                        option: data.item
                                                            .toString(),
                                                        multiselect: c
                                                            .checkMulti
                                                            .contains(
                                                                data.item),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ]),
                                        ),
                                      )
                                    : constrainedOptionContainer(
                                        context,
                                        SingleChildScrollView(
                                          child: Wrap(
                                            spacing: 5,
                                            runSpacing: 5,
                                            children: List.generate(
                                              c.multiselectList.length,
                                              (index) {
                                                final data =
                                                    c.multiselectList[index];
                                                return GestureDetector(
                                                  onTap: () {
                                                    if (c.isMultiSelect ==
                                                        'single-select') {
                                                      c.chatController.text =
                                                          data;
                                                      c.idController.text =
                                                          data;
                                                      c.sendMessage(context);
                                                    } else {
                                                      concateMultiSelect(
                                                          data, c);
                                                    }
                                                  },
                                                  child: amyOptionContainer(
                                                    multiselect: c.checkMulti
                                                        .contains(data),
                                                    option: data,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          c.sendMessage(context);
                        },
                        child:
                            c.otherSelected || c.isMultiSelect == 'multi-select'
                                ? sendMsgContainer()
                                : shrinked,
                        // child: c.otherSelected == false ||
                        //         c.isMultiSelect == 'single-select'
                        //     ? shrinked
                        //     : sendMsgContainer(),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void concateMultiSelect(String item, AmySignUpController c) {
    if (item.trim() == 'Other' || item.trim() == 'Others') {
      log(item);
      c.checkMulti.clear();
      c.checkMulti.add(item);
      // c.update(['send-to-amy']);
    } else {
      if (!c.checkMulti.contains('Other')) {
        if (c.checkMulti.length < 3) {
          if (!c.checkMulti.contains(item)) {
            c.checkMulti.add(item);
          } else {
            c.checkMulti.remove(item);
          }
        } else {
          if (c.checkMulti.contains(item)) {
            c.checkMulti.remove(item);
          }
        }
      }
    }
    log(c.checkMulti.toString());
    c.update(['send-to-amy']);
  }
}

Widget constrainedOptionContainer(BuildContext context, Widget? child) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.3,
      ),
      child: child,
    ),
  );
}
