import 'package:aimshala/controllers/profile_controller/profile_contact_info_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/bookcareercounsellcall/career_home_aimScreen/widgets/career__widgets.dart';
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
      // height: 53.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // width: double.infinity,
            color: kwhite,
            padding: const EdgeInsets.only(left: 0, right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(right: 7),
                  trailing: GestureDetector(
                    onTap: () => Get.back(),
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/images/close.png',
                            fit: BoxFit.cover)),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Text(
                    'Select your City',
                    style: TextStyle(
                      color: kblack,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextFormField(
                  // controller: searchMicroController,
                  onChanged: (query) {},
                  decoration: decorTextfield(
                    prefixWidget: const Icon(Icons.search, size: 25),
                    hintText: "Search",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 36.h,
            child: Obx(
              () => controller.isLoading.isTrue
                  ? const CircularProgressIndicator()
                  : controller.cityData.isEmpty
                      ? Text(
                          "No Cities found",
                          style: TextStyle(
                            color: kblack,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.cityData.length,
                          itemBuilder: (context, index) {
                            final data = controller.cityData[index];
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
