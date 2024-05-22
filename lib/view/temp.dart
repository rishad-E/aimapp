// ignore_for_file: use_build_context_synchronously

import 'package:aimshala/controllers/login_controller.dart';
import 'package:aimshala/models/UserModel/user_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/profile_add_course_info/add_course_info_screen.dart';
import 'package:aimshala/view/profile/profile_language_section/add_language_screen.dart';
import 'package:aimshala/view/profile/profile_volunteer_info/add_volunteer_experience_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? id;
    final UserDataModel? userData = Get.put(LoginController()).userData;
    if (userData != null) {
      id = userData.user?.id.toString() ?? '';
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton.icon(
              style: ButtonStyle(
                  shape: buttonShape(round: 8),
                  side:
                      MaterialStatePropertyAll(BorderSide(color: mainPurple))),
              onPressed: () =>
                  Get.to(() => ProfileAddLanguageScreen(uId: id.toString())),
              icon: Text(
                "Languages ",
                style: TextStyle(
                    fontSize: 11.sp,
                    color: mainPurple,
                    fontWeight: FontWeight.w600),
              ),
              label: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: mainPurple,
              ),
            ),
            hLBox,
            ElevatedButton.icon(
              style: ButtonStyle(
                  shape: buttonShape(round: 8),
                  side:
                      MaterialStatePropertyAll(BorderSide(color: mainPurple))),
              onPressed: () =>
                  Get.to(() => ProfileAddVolunteerExperienceScreen(uId: id.toString())),
              icon: Text(
                "volunteer experience ",
                style: TextStyle(
                    fontSize: 11.sp,
                    color: mainPurple,
                    fontWeight: FontWeight.w600),
              ),
              label: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: mainPurple,
              ),
            ),
            hLBox,
            ElevatedButton.icon(
              style: ButtonStyle(
                  shape: buttonShape(round: 8),
                  side:
                      MaterialStatePropertyAll(BorderSide(color: mainPurple))),
              onPressed: () =>
                  Get.to(() => ProfileAddCourseScreen(uId: id.toString())),
              icon: Text(
                "Course ",
                style: TextStyle(
                    fontSize: 11.sp,
                    color: mainPurple,
                    fontWeight: FontWeight.w600),
              ),
              label: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11.sp,
                color: mainPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



 // Future firstFunction() async {
    //   List<int> k = [];
    //   for (var i = 0; i < 10; i++) {
    //     k.add(i);
    //   }
    //   log(k.toString(), name: 'list k sample first');
    // }

    // Future secondFunction() async {
    //   // List<int> k = [];

    //   for (var i = 0; i < 5; i++) {
    //     // k.add(i);
    //     log(i.toString(), name: 'list k sample second');
    //   }
    //   // log(k.toString(), name: 'list k sample second');
    // }

    // Future thirdFunction() async {
    //   // List<int> k = [];

    //   for (var i = 0; i < 5; i++) {
    //     log(i.toString(), name: 'list k sample third');
    //   }
    //   // log(k.toString(), name: 'list k sample third');
    // }

    // Future fourthFunction() async {
    //   // List<int> k = [];

    //   for (var i = 0; i < 5; i++) {
    //     log(i.toString(), name: 'list k sample fourth');
    //   }
    //   // log(k.toString(), name: 'list k sample fourth');
    // }

  // await firstFunction();
                // showDialog(
                //   context: context,
                //   barrierDismissible: false,
                //   builder: (_) {
                //     return AlertDialog(
                //       backgroundColor: kwhite,
                //       surfaceTintColor: kwhite,
                //       content: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           CircularProgressIndicator(color: mainPurple),
                //           hLBox,
                //           primarytxt2(
                //               "Your result is being processed...", 11.sp),
                //         ],
                //       ),
                //     );
                //   },
                // );
                // await Future.delayed(const Duration(seconds: 5));
                // await secondFunction();
                // await Future.wait([thirdFunction(), fourthFunction()]);
                // Get.to(() => const HomeScreen());