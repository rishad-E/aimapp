import 'dart:developer';
import 'package:aimshala/controllers/amy_chat_bot_controller.dart';
import 'package:aimshala/view/chatbot/widgets/amy_chat_widgets.dart';
import 'package:aimshala/view/chatbot/widgets/amy_radial_gradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmyChatBotScreen extends StatelessWidget {
  const AmyChatBotScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmyChatBotController());
    return Scaffold(
      appBar: amyBotAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 30),
              child: AmyBotRadialColor(),
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
                              child: sendcard(context, data.message, data.time),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: replaycard(context, 'Typing...', data.time,
                                  type: true),
                            ),
                          ],
                        );
                      } else {
                        return data.isSender
                            ? sendcard(context, data.message, data.time)
                            : replaycard(context, data.message, data.time);
                      }
                    },
                  ),
                ),
              ),
            ),
            GetBuilder<AmyChatBotController>(
                id: 'amy-chatBot',
                builder: (c) {
                  return Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 0),
                          child: textFieldContainer(
                            child: TextField(
                                controller: controller.chatController,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                onSubmitted: (value) {
                                  if (controller
                                      .chatController.text.isNotEmpty) {
                                    log('send message', name: 'send message');
                                    controller.sendMessage();
                                  }
                                },
                                textInputAction: TextInputAction.send,
                                // showCursor: false,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                                decoration: textFieldDecor()),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.chatController.text.isNotEmpty) {
                            log('send message', name: 'send message');
                            controller.sendMessage();
                          }
                        },
                        child: sendMsgBox(),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
