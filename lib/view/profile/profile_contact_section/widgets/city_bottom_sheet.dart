import 'package:aimshala/controllers/profile_controller/profile_contact_info_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_aim_screen/widgets/career__widgets.dart';
import 'package:aimshala/view/profile/profile_contact_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CityBottomSheetClass extends StatelessWidget {
  const CityBottomSheetClass({super.key});

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
              buildBottomsheetTop(item: 'City'),
              GetBuilder<UpdateContactInfo>(
                  id: 'update-citySearch',
                  builder: (c) {
                    return TextFormField(
                      controller: c.searchController,
                      onChanged: (query) {
                        c.filterCity(query);
                      },
                      decoration: decorTextfield(
                        prefixWidget: const Icon(Icons.search, size: 25),
                        hintText: "Search",
                      ),
                    );
                  }),
            ],
          ),
          SizedBox(
            height: 36.h,
            child: Obx(
              () => controller.isLoading.isTrue
                  ? Center(
                      child: CircularProgressIndicator(
                          strokeWidth: 1, color: mainPurple))
                  : controller.cityData.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "No Cities found",
                            style: TextStyle(
                              color: textFieldColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.filteredCityData.length,
                          itemBuilder: (context, index) {
                            final data = controller.filteredCityData[index];
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
                                    value: controller.cityController.text ==
                                        data.name,
                                    onChanged: (value) {
                                      if (value != null && value) {
                                        controller.cityController.text =
                                            data.name.toString();
                                        controller
                                            .update(['update-contactInfo']);
                                        Get.back();
                                      }
                                    },
                                  ),
                                  onTap: () {
                                    controller.cityController.text =
                                        data.name.toString();
                                    controller.update(['update-contactInfo']);
                                    Get.back();
                                  },
                                ),
                                const Divider(height: 4),
                              ],
                            );
                          },
                        ),
            ),
          )
        ],
      ),
    );
  }
}
