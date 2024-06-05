import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_contact_info_controller.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateBottomSheetClass extends StatelessWidget {
  const StateBottomSheetClass({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UpdateContactInfo>();
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
                'Select your State',
                style: TextStyle(
                  color: kblack,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Obx(
              () => controller.errorMessage.value == 'error occurred'
                  ? const Text('Error fetching State')
                  : controller.stateData.isEmpty
                      ? const Text("Result not found")
                      : Column(
                          children: List.generate(
                            controller.stateData.length,
                            (index) {
                              final data = controller.stateData[index];
                              return ListTile(
                                shape: const Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(
                                            255, 202, 201, 201))),
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  data.name.toString(),
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
                                  value:  controller.stateController.text ==
                                          data.name
                                     ,
                                  onChanged: (value) {
                                    if (value != null && value) {
                                      // if (filed == 'State') {
                                        controller.stateController.text =
                                            data.name.toString();
                                        controller
                                            .update(['update-contactInfo']);
                                        Get.back();
                                        log(data.id.toString(),
                                            name: 'state id');
                                        controller.fetchCities(
                                            stateId: data.id.toString());
                                      // }
                                      // } else {
                                      //   controller.countryController.text ='India';
                                      //       // data.name.toString();
                                      //   controller
                                      //       .update(['update-contactInfo']);
                                      //   Get.back();
                                      //   log(data.id.toString(),
                                      //       name: 'state id');
                                      //   controller.fetchCities(
                                      //       stateId: data.id.toString());
                                      // }
                                    }
                                  },
                                ),
                                onTap: () {
                                  // if (filed == 'State') {
                                    controller.stateController.text =
                                        data.name.toString();
                                    controller.update(['update-contactInfo']);
                                    Get.back();
                                    log(data.id.toString(), name: 'state id');
                                    controller.fetchCities(
                                        stateId: data.id.toString());
                                  // } 
                                  // else {
                                  //   controller.countryController.text =
                                  //       data.name.toString();
                                  //   controller.update(['update-contactInfo']);
                                  //   Get.back();
                                  //   log(data.id.toString(), name: 'state id');
                                  //   controller.fetchCities(
                                  //       stateId: data.id.toString());
                                  // }
                                },
                              );
                            },
                          ),
                        ),
            )
          ],
        ),
      ),
    );
  }
}
