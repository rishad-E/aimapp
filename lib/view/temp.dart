import 'dart:developer';
import 'package:aimshala/controllers/all_data_controller.dart';
import 'package:aimshala/controllers/counselor_controllers/counselor_final_media_controller.dart';
import 'package:aimshala/controllers/counselor_controllers/counselor_personal_controller.dart';
import 'package:aimshala/controllers/educator_controllers/educator_add_media_controller.dart';
import 'package:aimshala/controllers/educator_controllers/educator_personal_detail_controller.dart';
import 'package:aimshala/controllers/mentor_controllers/mentor_add_media_controller.dart';
import 'package:aimshala/controllers/mentor_controllers/mentor_personal_details_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/AIMCET_test/AIMCET_RESULT_Screen/aimcet_result_screen.dart';
import 'package:aimshala/view/counselor_registration/c_already_exist_page/counselor_already_exist_page.dart';
import 'package:aimshala/view/counselor_registration/c_personal_detail_section/c_personal_detail_page.dart';
import 'package:aimshala/view/educator_registration/already_exist_page/educator_already_exist.dart';
import 'package:aimshala/view/educator_registration/personal_detail_section/personal_deail_page.dart';
import 'package:aimshala/view/mentor_registration/already_exist_mentor/mentor_already_exist_page.dart';
import 'package:aimshala/view/mentor_registration/mentor_personal_detail_section/mentor_personal_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TempScreen extends StatelessWidget {
  final String name;
  TempScreen({super.key, required this.name});

  final mentor = Get.put(MentorPersonalDetailController());
  final educator = Get.put(EducatorPersonalDetailController());
  final counselor = Get.put(CounselorPersonalController());
  final alldataC = Get.put(AllDataController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((time) {
      log('message');
      alldataC.getUserallData();
      mentor.checkMentorRegtakenFunction();
      educator.checkEducatorRegTakenFunction();
      counselor.checkCounselorRegtakenFunction();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temp Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            hMBox,
            elevatedButtonItems(
              onPressed: () {
                log(educator.isEducator, name: 'isEducator');
                if (educator.isEducator == 'no') {
                  Get.put(EducatorMediaAddController())
                      .deleteAllEducatorControllers();
                  Get.to(
                    () => EducatorPersonalDetailPage(
                      user: alldataC.userData,
                      userDetails: alldataC.userDetails,
                    ),
                    transition: Transition.fadeIn,
                  );
                } else {
                  Get.to(() => EducatorAlreadyExistPage(name: name),
                      transition: Transition.fadeIn);
                }
              },
              item: 'Educator',
            ),
            hMBox,
            elevatedButtonItems(
              onPressed: () {
                log(mentor.isMentor, name: 'isMentor');
                if (mentor.isMentor == 'no') {
                  Get.put(MentorAddMediaController())
                      .deleteAllMentorControllers();
                  Get.to(
                    () => MentorPersonalDetailPage(
                      user: alldataC.userData,
                      userDetails: alldataC.userDetails,
                    ),
                    transition: Transition.fadeIn,
                  );
                } else {
                  Get.to(() => MentorAlreadyExistPage(name: name),
                      transition: Transition.fadeIn);
                }
              },
              item: 'Mentor',
            ),
            hMBox,
            elevatedButtonItems(
              onPressed: () {
                log(counselor.isCounselor, name: 'isCounselor');
                if (counselor.isCounselor == 'no') {
                  Get.put(CounselorMediaController()).clearAllControllerClass();
                  Get.to(
                    () => CounselorPersonalSection(
                      user: alldataC.userData,
                      userDetails: alldataC.userDetails,
                    ),
                  );
                  Get.to(() => CounselorAlreadyExistPage(name: name),
                      transition: Transition.fadeIn);
                } else {
                  Get.to(() => CounselorAlreadyExistPage(name: name),
                      transition: Transition.fadeIn);
                }
              },
              item: "Counselor",
            ),
            elevatedButtonItems(
              onPressed: () => Get.to(() => const AimcetResultScreen()),
              item: 'your-journey-temp',
            )
          ],
        ),
      ),
    );
  }
}

Widget elevatedButtonItems(
    {required void Function()? onPressed, required String item}) {
  return ElevatedButton.icon(
    style: ButtonStyle(
        shape: buttonShape(round: 8),
        side: MaterialStatePropertyAll(BorderSide(color: mainPurple))),
    onPressed: onPressed,
    icon: Text(
      item,
      style: TextStyle(
          fontSize: 11.sp, color: mainPurple, fontWeight: FontWeight.w600),
    ),
    label: Icon(
      Icons.arrow_forward_ios_sharp,
      size: 11.sp,
      color: mainPurple,
    ),
  );
}

/*

      Directory? directory;
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        if (await Permission.manageExternalStorage.isGranted) {
          directory = Directory('/storage/emulated/0/Download');
          if (!await directory.exists()) {
            directory = Directory('/storage/emulated/0/Downloads');
          }
        } else {
          var status = await Permission.manageExternalStorage.request();
          if (status.isGranted) {
            directory = Directory('/storage/emulated/0/Download');
            if (!await directory.exists()) {
              directory = Directory('/storage/emulated/0/Downloads');
            }
          } else {
            directory = await getExternalStorageDirectory();
          }

          // directory = await getExternalStorageDirectory();
        }
      }
      if (directory == null) {
        throw const FileSystemException('Unable to access storage directory');
      }


      Directory? directory;
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        if (await Permission.storage.isGranted) {
          directory = Directory('/storage/emulated/0/Download');
          if (!await directory.exists()) {
            directory = Directory('/storage/emulated/0/Downloads');
          }
        } else {
          var status = await Permission.storage.request();
          if (status.isGranted) {
            directory = Directory('/storage/emulated/0/Download');
            if (!await directory.exists()) {
              directory = Directory('/storage/emulated/0/Downloads');
            }
          } else {
            directory = await getExternalStorageDirectory();
          }

          // directory = await getExternalStorageDirectory();
        }
      }
      if (directory == null) {
        throw const FileSystemException('Unable to access storage directory');
      }
 */

