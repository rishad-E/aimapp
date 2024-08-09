import 'dart:developer';

import 'package:aimshala/controllers/profile_controller/profile_contact_info_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_aim_screen/widgets/career__widgets.dart';
import 'package:aimshala/view/profile/profile_contact_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class StateBottomSheetClass extends StatelessWidget {
  StateBottomSheetClass({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UpdateContactInfo>();
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
      decoration: bottomSheetDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              buildBottomsheetTop(item: 'State'),
              TextFormField(
                controller: searchController,
                onChanged: (query) {
                  controller.filterStates(query);
                },
                decoration: decorTextfield(
                  prefixWidget: const Icon(Icons.search, size: 25),
                  hintText: "Search",
                ),
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 36.h,
            child: Obx(() => controller.errorMessage.value == 'error occurred'
                ? const Text('Error fetching State')
                : controller.filteredStateData.isEmpty
                    ? const Text("Result not found")
                    : ListView.builder(
                        itemCount: controller.filteredStateData.length,
                        itemBuilder: (context, index) {
                          final data = controller.filteredStateData[index];
                          return Column(
                            children: [
                              ListTile(
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
                                  value: controller.stateController.text ==
                                      data.name,
                                  onChanged: (value) {
                                    if (value != null && value) {
                                      controller.stateController.text =
                                          data.name.toString();
                                      controller.update(['update-contactInfo']);
                                      Get.back();
                                      log(data.id.toString(), name: 'state id');
                                      controller.fetchCities(
                                          stateId: data.id.toString());
                                    }
                                  },
                                ),
                                onTap: () {
                                  controller.stateController.text =
                                      data.name.toString();
                                  controller.update(['update-contactInfo']);
                                  Get.back();
                                  log(data.id.toString(), name: 'state id');
                                  controller.fetchCities(
                                      stateId: data.id.toString());
                                },
                              ),
                              const Divider(height: 4),
                            ],
                          );
                        },
                      )),
          )
        ],
      ),
    );
  }
}
