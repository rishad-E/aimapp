import 'package:aimshala/controllers/counselor_controllers/counselor_reference_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounselorRelationSheet extends StatelessWidget {
  final String ref;
  const CounselorRelationSheet({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<CounselorReferenceController>();
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
                'Select Relation',
                style: TextStyle(
                  color: kblack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Column(
              children: List.generate(
                c.relationList.length,
                (index) {
                  final data = c.relationList[index];
                  return ListTile(
                    shape: const Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 202, 201, 201))),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      data.name ?? '',
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
                      value: ref == '1'
                          ? c.relation1Controller.text == data.name
                          : c.relation2Controller.text == data.name,
                      onChanged: (value) {
                        if (value != null && value) {
                          if (ref == '1') {
                            c.relation1Controller.text = data.name ?? '';
                            c.otherRela1.value = data.name.toString();
                            c.checkAllFileds();
                          } else {
                            c.relation2Controller.text = data.name ?? '';
                            c.otherRela2.value = data.name.toString();
                            c.checkAllFileds();
                          }
                          Get.back();
                        }
                      },
                    ),
                    onTap: () {
                      if (ref == '1') {
                        c.relation1Controller.text = data.name ?? '';
                        c.otherRela1.value = data.name.toString();
                        c.checkAllFileds();
                      } else {
                        c.relation2Controller.text = data.name ?? '';
                        c.otherRela2.value = data.name.toString();
                        c.checkAllFileds();
                      }
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
