import 'package:aimshala/controllers/profile_controller/profile_honoraward_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwardAssosiatedBottomsheet extends StatelessWidget {
  const AwardAssosiatedBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ProfileHonorsAwardsController>();
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
                'Please Select',
                style: TextStyle(
                  color: kblack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              children: List.generate(
                c.assosiatedListdata.length,
                (index) {
                  final data = c.assosiatedListdata;
                  return ListTile(
                    shape: const Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 202, 201, 201))),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      data[index],
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
                      value: c.assosiatedController.text == data[index],
                      onChanged: (value) {
                        if (value != null && value) {
                          checkListDataUpdate(c, data[index]);
                        }
                      },
                    ),
                    onTap: () {
                      checkListDataUpdate(c, data[index]);
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

  void checkListDataUpdate(ProfileHonorsAwardsController c, String item) {
    c.assosiatedController.text = item;
    c.update(['update-HonorAwardsbutton']);
    c.allFieldSelect();
    Get.back();
  }
}
