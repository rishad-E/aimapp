import 'package:aimshala/controllers/profile_controller/profile_license_certification_controller.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_license_certifications_section/add_media_secreen.dart';
import 'package:aimshala/view/profile/profile_license_certifications_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddLicenseLinkScreen extends StatelessWidget {
  final String uId;
  final ProfileLicenseCertificationController controller;
  final License? license;
  AddLicenseLinkScreen(
      {super.key, required this.uId, required this.controller, this.license});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: profileAppBar(title: 'Add Link', doneWidget: shrinked),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                licenseInfoFiled(
                  text: regularText(
                      'Paste or type a link to an article, file or video.',
                      9.5.sp,
                      color: kblack),
                  textField: TextFormField(
                    validator: (value) => controller.mediaLinkValidation(value),
                    controller: controller.mediaLinkController,
                    decoration: infoFieldDecoration(
                      suffixWidget: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.pickImageMedia().then((value) {
                              if (value != null) {
                                controller.mediaTitleController.clear();
                                controller.mediaDescriptionController.clear();
                                Get.to(() => AddLicenseMediaScreen(
                                      image: value,
                                      uId: uId,
                                      controller: controller,
                                      license: license,
                                    ));
                              }
                            });
                          }
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    style: const TextStyle(fontSize: 13),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
