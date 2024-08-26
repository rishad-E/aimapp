import 'dart:io';
import 'package:aimshala/controllers/aimcet_test_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class TestResDownloadPage extends StatelessWidget {
  const TestResDownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<AIMCETController>();
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF12054E),
            Color(0xFF37065D),
            Color(0xFF45108A),
          ],
          stops: [0.0, 0.4531, 1.0],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 23.h,
            child: Image.asset('assets/images/chip.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              height: 5.5.h,
              child: Image.asset('assets/images/acecet-home.png'),
            ),
          ),
          boldText(text: 'Download', size: 20, color: kwhite),
          regularText('Your Test Report', 20, color: kwhite),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            child: SizedBox(
                height: 4.2.h,
                child: Obx(
                  () => c.isDownloading.value == true
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(kwhite),
                          strokeWidth: 1,
                        )
                      : ElevatedButton.icon(
                          style: ButtonStyle(
                            shape: buttonShape(round: 8),
                          ),
                          icon: Text(
                            "Download Now!",
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: const Color.fromARGB(255, 147, 38, 143),
                                fontWeight: FontWeight.w600),
                          ),
                          label: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 11.sp,
                            color: const Color.fromARGB(255, 147, 38, 143),
                          ),
                          onPressed: () async {
                            const String pdfUrl =
                                'http://154.26.130.161/elearning/api/result-pdf';
                            const fileName = 'ACE Test result.pdf';

                            try {
                              //android:requestLegacyExternalStorage="true" is currently not added but added permission for manage storage in manifest
                              //request permission if not granded
                              await permissionRequest();
                              await c.downloadPDF(pdfUrl, fileName);
                            } catch (e) {
                              Get.snackbar(
                                "Error",
                                "Failed to download PDF: $e",
                                snackPosition: SnackPosition.TOP,
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.red.withOpacity(0.7),
                                colorText: Colors.white,
                              );
                            }
                          },
                        ),
                )),
          )
        ],
      ),
    );
  }

  Future<void> permissionRequest() async {
    if (await Permission.storage.isGranted) return;

    var status = await Permission.storage.request();
    if (status.isGranted) {
      return;
    } else if (status.isDenied) {
      //retry request permission access
      status = await Permission.storage.request();
      if (status.isGranted) {
        return;
      } else if (status.isPermanentlyDenied) {
        await openAppSettings();
        if (await Permission.storage.isGranted) {
          return;
        } else {
          throw const FileSystemException(
              'Storage permission permanently denied');
        }
      }
    }
    if (Platform.isAndroid) {
      if (await Permission.manageExternalStorage.isGranted) {
        return;
      }
      var manageStorageStatus = await Permission.storage.request();
      if (!manageStorageStatus.isGranted) {
        throw const FileSystemException(
            'Manage external storage permission denied');
      }
    }
  }
}
