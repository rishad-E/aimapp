import 'package:aimshala/controllers/mentor_controllers/mentor_personal_details_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusBottomSheet extends StatelessWidget {
  const StatusBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MentorPersonalDetailController>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 10, 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              trailing: GestureDetector(
                onTap: () => Get.back(),
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/images/close.png',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Text(
                'Select your Current Status',
                style: TextStyle(
                  color: kblack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              children: List.generate(
                controller.statusList.length,
                (index) {
                  final data = controller.statusList[index];
                  return ListTile(
                    shape: const Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 202, 201, 201))),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      data.title.toString(),
                      style: TextStyle(
                        color: kblack,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Checkbox(
                      side: BorderSide.none,
                      activeColor: mainPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      value: data.title == controller.statusController.text,
                      onChanged: (value) {
                        if (value != null && value) {
                          controller.statusController.text =
                              data.title.toString();
                          controller.checkAllFileds();
                          Get.back();
                        }
                      },
                    ),
                    onTap: () {
                      controller.statusController.text = data.title.toString();
                      controller.checkAllFileds();
                      Get.back();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
