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
  final String uId;
  final String phone;
  const SignUpAmyScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.uId,
      required this.phone});
  @override
  Widget build(BuildContext context) {
    log('uId=>$uId name=>$name email=>$email phone=>$phone',
        name: 'amy screeeeeeeeen');
    final controller = Get.put(AmySignUpController(name, email, uId, phone));
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
                                  context, 'Typing...', data.time, true,
                                  type: true),
                            ),
                          ],
                        );
                      } else {
                        return data.isSender
                            ? sendcardSignup(context, data.message, data.time)
                            : replaycardSignup(
                                context, data.message, data.time, data.isFirst);
                      }
                    },
                  ),
                ),
              ),
            ),
            GetBuilder<AmySignUpController>(
              id: 'send-to-amy',
              builder: (c) {
                if (c.skipQuestion || c.qusId == 17) {
                  return GestureDetector(
                    // onTap: () => Get.to(() => const SplashScreen()),
                    child: goHomeContainer(),
                  );
                } else {
                  return Row(
                    children: [
                      Expanded(
                        child: amySignupTextfield(
                          child: c.isMultiSelect == 'single-select'
                              ? Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: [
                                        c.qusId == 0
                                            ? skipText(
                                                onTap: () {
                                                  c.skipQuestion = true;
                                                  c.update(['send-to-amy']);
                                                },
                                              )
                                            : shrinked,
                                        ...List.generate(
                                          c.singleSelectList.length,
                                          (index) {
                                            final data =
                                                c.singleSelectList[index];
                                            return GestureDetector(
                                              onTap: () {
                                                c.chatController.text =
                                                    data.item.toString();
                                                c.idController.text =
                                                    data.id.toString();
                                                c.sendMessage(context);
                                              },
                                              child: amyOptionContainer(
                                                option: data.item.toString(),
                                                multiselect: false,
                                              ),
                                            );
                                          },
                                        ),
                                      ]),
                                )
                              : Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Wrap(
                                        spacing: 5,
                                        runSpacing: 5,
                                        children: List.generate(
                                          c.multiselectList.length,
                                          (index) {
                                            final data = c.multiselectList[index];
                                            return GestureDetector(
                                              onTap: () =>
                                                  concateMultiSelect(data, c),
                                              child: amyOptionContainer(
                                                multiselect:
                                                    c.checkMulti.contains(data),
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
                      ),
                      InkWell(
                        onTap: () {
                          if (c.chatController.text.isNotEmpty ||
                              c.multiselectList.isNotEmpty) {
                            log(c.chatController.text, name: 'chat controller');
                            c.sendMessage(context);
                          }
                        },
                        child: c.isMultiSelect == 'single-select'
                            ? shrinked
                            : sendMsgContainer(),
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
    if (!c.checkMulti.contains(item)) {
      c.checkMulti.add(item);
    } else {
      c.checkMulti.remove(item);
    }
    c.update(['send-to-amy']);
  }
}

//                          amySignupTextfield(
//                           child: c.qusId == 0
//                               ? TextFormField(
//                                   textCapitalization:
//                                       TextCapitalization.sentences,
//                                   controller: c.chatController,
//                                   keyboardType: c.isAskingDOB
//                                       ? TextInputType.number
//                                       : TextInputType.text,
//                                   inputFormatters: c.isAskingDOB
//                                       ? [DateInputFormatter()]
//                                       : [],
//                                   textInputAction: TextInputAction.send,
//                                   style: const TextStyle(fontSize: 13),
//                                   decoration: amyTextfieldDecor(
//                                       isAskingDOB: c.isAskingDOB),
//                                   onFieldSubmitted: (value) {
//                                     log(c.chatController.text, name: 'dob');
//                                     c.sendMessage(context);
//                                   },
//                                 )
//                               : c.qusId == 1
//                                   ? c.otherSelected
//                                       ? TextFormField(
//                                           decoration: amyTextfieldDecor(),
//                                           controller: c.chatController,
//                                           style: const TextStyle(fontSize: 13),
//                                           onFieldSubmitted: (value) {
//                                             if (value.isNotEmpty) {
//                                               c.sendMessage(context);
//                                             }
//                                           },
//                                         )
//                                       : Container(
//                                           padding: const EdgeInsets.symmetric(
//                                               vertical: 10),
//                                           child: Wrap(
//                                             spacing: 5,
//                                             runSpacing: 5,
//                                             children: List.generate(
//                                               c.genderOptionList.length,
//                                               (index) {
//                                                 final data =
//                                                     c.genderOptionList[index];
//                                                 return InkWell(
//                                                   onTap: () {
//                                                     log(data,
//                                                         name: 'g selected');
//                                                     c.chatController.text =
//                                                         data;
//                                                     c.sendMessage(context);
//                                                   },
//                                                   child: amyOptionContainer(
//                                                       option: data),
//                                                 );
//                                               },
//                                             ),
//                                           ),
//                                         )
//                                   : c.otherSelected
//                                       ? TextFormField(
//                                           controller: c.chatController,
//                                           decoration: amyTextfieldDecor(),
//                                           style: const TextStyle(fontSize: 13),
//                                           onChanged: (value) => log(
//                                               c.chatController.text,
//                                               name: 'chatC'),
//                                           onFieldSubmitted: (value) {
//                                             if (value.isNotEmpty) {
//                                               c.sendMessage(context);
//                                             }
//                                           },
//                                         )
//                                       : Container(
//                                           padding: const EdgeInsets.symmetric(
//                                               vertical: 10),
//                                           child: ConstrainedBox(
//                                             constraints: BoxConstraints(
//                                               maxHeight: MediaQuery.of(context)
//                                                       .size
//                                                       .height *
//                                                   0.3,
//                                             ),
//                                             child: SingleChildScrollView(
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   c.qusId == 2
//                                                       ? shrinked
//                                                       : GestureDetector(
//                                                           onTap: () {
//                                                             c.skipQuestion =
//                                                                 true;
//                                                             c.update([
//                                                               'send-to-amy'
//                                                             ]);
//                                                           },
//                                                           child: skipText(),
//                                                         ),
//                                                   c.qusId == 2
//                                                       ? shrinked
//                                                       : hBox,
//                                                   Wrap(
//                                                     spacing: 5,
//                                                     runSpacing: 5,
//                                                     children: List.generate(
//                                                       c.otherOptionList.length,
//                                                       (index) {
//                                                         final data =
//                                                             c.otherOptionList[
//                                                                 index];
//                                                         return InkWell(
//                                                           onTap: () {
//                                                             log("id=>${data.id} item=>${data.item}",
//                                                                 name:
//                                                                     'other option selected');
//                                                             c.chatController
//                                                                     .text =
//                                                                 data.id
//                                                                     .toString();
//                                                             c.otherOptionController
//                                                                     .text =
//                                                                 data.item
//                                                                     .toString();
//                                                             c.sendMessage(
//                                                                 context);
//                                                           },
//                                                           child: amyOptionContainer(
//                                                               option: data.item
//                                                                   .toString()),
//                                                         );
//                                                       },
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                         ),
