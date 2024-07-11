import 'package:aimshala/controllers/profile_controller/profile_language_course_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CourseBottomsheet extends StatelessWidget {
  const CourseBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<LanguageAndCourseController>();
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(27),
          topRight: Radius.circular(27),
        ),
      ),
      height: 47.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              'Please Select',
              style: TextStyle(
                color: kblack,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  c.associatedListdata.length,
                  (index) {
                    final data = c.associatedListdata[index];
                    return Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            data,
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
                            value: c.courseAssosiatedController.text == data,
                            onChanged: (value) {
                              if (value != null && value) {
                                c.courseAssosiatedController.text = data;
                                c.update(['update-courseInfo']);
                                Get.back();
                              }
                            },
                          ),
                          onTap: () {
                            c.courseAssosiatedController.text = data;
                            c.update(['update-courseInfo']);
                            Get.back();
                          },
                        ),
                        const Divider(height: 1),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
