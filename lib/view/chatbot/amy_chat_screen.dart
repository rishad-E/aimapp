import 'dart:developer';
import 'package:aimshala/services/AMY_chat_bot/chat_bot_service.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/view/chatbot/widgets/amy_chat_widgets.dart';
import 'package:aimshala/view/chatbot/widgets/amy_radial_gradient.dart';
import 'package:aimshala/view/chatbot/widgets/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AmyChatBotScreen extends StatefulWidget {
  const AmyChatBotScreen({super.key});

  @override
  State<AmyChatBotScreen> createState() => _AmyChatBotScreenState();
}

class _AmyChatBotScreenState extends State<AmyChatBotScreen> {
  TextEditingController chatController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<ChatMessage> msgs = [];
  bool isTyping = false;
  @override
  void initState() {
    super.initState();
    addDefaultMessage();
  }

  void addDefaultMessage() {
    DateTime now = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(now);
    String defaultMsg = "Hi I am Amy Your AI Career Guide How can i help you?";
    msgs.add(ChatMessage(false, defaultMsg, currentTime));
  }

  // void sendMsg() async {
  //   DateTime now = DateTime.now();
  //   String currentTime = DateFormat('h:mm a').format(now);
  //   log(currentTime);
  //   String text = chatController.text;
  //   chatController.clear();
  //   if (text.isNotEmpty) {
  //     setState(() {
  //       msgs.insert(0, ChatMessage(true, text, currentTime));
  //       isTyping = true;
  //     });
  //     scrollController.animateTo(0.0,
  //         duration: const Duration(seconds: 1), curve: Curves.easeOut);
  //     String? res = await ChatBotService().sendMessageFunction(text);
  //     if (res != null) {
  //       setState(() {
  //         isTyping = false;
  //         msgs.insert(0, ChatMessage(false, res, currentTime));
  //       });
  //       scrollController.animateTo(0.0,
  //           duration: const Duration(seconds: 1), curve: Curves.easeOut);
  //     } else {
  //       Get.showSnackbar(
  //         const GetSnackBar(
  //           snackStyle: SnackStyle.FLOATING,
  //           message: 'Some error occurred, please try again!',
  //           margin: EdgeInsets.all(10),
  //           backgroundColor: Colors.red,
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //     }
  //   }
  // }
  void sendMsg() async {
    DateTime now = DateTime.now();
    String currentTime = DateFormat('h:mm a').format(now);
    log(currentTime);
    String text = chatController.text;
    chatController.clear();
    if (text.isNotEmpty) {
      if (!mounted) return; // Check if the widget is still mounted
      setState(() {
        msgs.insert(0, ChatMessage(true, text, currentTime));
        isTyping = true;
      });
      scrollController.animateTo(0.0,
          duration: const Duration(seconds: 1), curve: Curves.easeOut);
      String? res = await ChatBotService().sendMessageFunction(text);
      if (!mounted) return; // Check if the widget is still mounted
      if (res != null) {
        setState(() {
          isTyping = false;
          msgs.insert(0, ChatMessage(false, res, currentTime));
        });
        scrollController.animateTo(0.0,
            duration: const Duration(seconds: 1), curve: Curves.easeOut);
      } else {
        if (!mounted) return; // Check if the widget is still mounted
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
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ChatBotAmyController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Talk to Amy",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        centerTitle: true,
        surfaceTintColor: Colors.white,
        elevation: 7,
        shadowColor: Colors.black.withOpacity(0.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 25),
              child: AmyBotRadialColor(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: msgs.length,
                  itemBuilder: (context, index) {
                    if (isTyping && index == 0) {
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: sendcard(
                                context, msgs[index].message, msgs[index].time),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: replaycard(
                                context, 'Typing...', msgs[index].time,
                                type: true),
                          ),
                        ],
                      );
                    } else {
                      if (msgs[index].isSender == true) {
                        return sendcard(
                            context, msgs[index].message, msgs[index].time);
                      } else {
                        return replaycard(
                            context, msgs[index].message, msgs[index].time);
                      }
                    }
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 229, 226, 226),
                              width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          controller: chatController,
                          textCapitalization: TextCapitalization.sentences,
                          onSubmitted: (value) {
                            if (chatController.text.isNotEmpty) {
                              log('send message', name: 'send message');
                              sendMsg();
                            }
                          },
                          textInputAction: TextInputAction.send,
                          // showCursor: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type here....",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: textFieldColor,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (chatController.text.isNotEmpty) {
                      log('send message', name: 'send message');
                      sendMsg();
                    }
                  },
                  child: Container(
                    height: 4.7.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: mainPurple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/sent.svg',
                      fit: BoxFit.scaleDown,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}






            // Container(
            //   height: 108,
            //   width: 168,
            //   padding: const EdgeInsets.symmetric(vertical: 3),
            // decoration: BoxDecoration(
            // shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(144),
            // gradient: LinearGradient(
            //   begin: Alignment.centerLeft,
            //   end: Alignment.centerRight,
            //   colors: [
            //     // kwhite.withOpacity(0.3),
            //     kwhite.withOpacity(0.4),
            //     const Color.fromARGB(255, 170, 229, 232).withOpacity(0.1),
            //     const Color.fromARGB(255, 15, 187, 195).withOpacity(0.1),
            //     kwhite.withOpacity(0.1),
            //     const Color.fromARGB(255, 147, 38, 143).withOpacity(0.1),
            //     const Color.fromARGB(255, 147, 38, 143).withOpacity(0.1),
            //     const Color.fromARGB(255, 147, 38, 143).withOpacity(0.0),
            //     // kwhite.withOpacity(0.0),
            //   ],
            // ),
            //     gradient: RadialGradient(
            //       // radius: 0.8,
            //   colors: [
            //     const Color.fromARGB(255, 15, 187, 195).withOpacity(0.1),
            //     // kwhite.withOpacity(0.1),
            //     const Color.fromARGB(255, 147, 38, 143).withOpacity(0.1),
            //   ],
            // )),
            //   child: Container(
            //     height: 11.5.h,
            //     width: 25.5.w,
            //     // height: 108,
            //     // width: 108,
            //     // color: Colors.yellow,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: kwhite,
            //       image: const DecorationImage(
            //         image: AssetImage('assets/images/person.png'),
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),