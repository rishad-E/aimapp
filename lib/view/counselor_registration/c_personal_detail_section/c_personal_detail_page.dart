import 'package:aimshala/controllers/counselor_controllers/counselor_personal_controller.dart';
import 'package:aimshala/models/UserModel/user_details_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/counselor_registration/c_background_details_section/c_edu_background_detail_page.dart';
import 'package:aimshala/view/counselor_registration/c_personal_detail_section/widget/c_status_bottom_sheet.dart';
import 'package:aimshala/view/counselor_registration/common/widgets/counselor_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CounselorPersonalSection extends StatelessWidget {
  final UserData? user;
  final UserDataModel? userDetails;
  CounselorPersonalSection({super.key, this.user, this.userDetails});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounselorPersonalController());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initializeFields(userDetails, user, controller);
    });
    return Scaffold(
      appBar: counselorAppBar(backArrow: true),
      body: counselorContainer(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              counselorRichText(text1: 'Personal', text2: 'Details'),
              hLBox,
              counselorFields(
                fieldItem: 'Full Name',
                textfiled: TextFormField(
                  readOnly: user?.name != null,
                  controller: controller.nameController,
                  validator: (value) => controller.namedValidation(value),
                  onChanged: (value) => controller.checkAllFileds(),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: infoFieldDecoration(hintText: 'Enter Full Name'),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              counselorFields(
                fieldItem: 'Email',
                textfiled: TextFormField(
                  readOnly: user?.email != null,
                  controller: controller.emailController,
                  validator: (value) => controller.emailValidation(value),
                  onChanged: (value) => controller.checkAllFileds(),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      infoFieldDecoration(hintText: 'Enter Email Address'),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              counselorFields(
                fieldItem: 'City/Location',
                textfiled: TextFormField(
                  controller: controller.locationController,
                  validator: (value) => controller.fieldValidation(value),
                  onChanged: (value) => controller.checkAllFileds(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:
                      infoFieldDecoration(hintText: 'Enter City/Location'),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              counselorFields(
                fieldItem: 'Date of Birth',
                textfiled: TextFormField(
                  readOnly: true,
                  controller: controller.dobController,
                  validator: (value) => controller.fieldValidation(value),
                  onChanged: (value) => controller.checkAllFileds(),
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: infoFieldDecoration(
                    hintText: 'Enter DOB',
                    suffixWidget: GestureDetector(
                      onTap: () => controller.datePicker(context),
                      child: calendarIcon(),
                    ),
                  ),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              Obx(
                () => counselorFields(
                  fieldItem: 'Gender',
                  textfiled: DropdownButtonFormField<String>(
                    value: controller.selectedGender.value,
                    icon: Icon(Icons.keyboard_arrow_down,
                        size: 26, color: kblack),
                    onChanged: userDetails?.gender == null
                        ? (newValue) {
                            controller.selectedGender.value = newValue!;
                            controller.checkAllFileds();
                          }
                        : null,
                    validator: (value) => controller.fieldValidation(value),
                    // hint: Text("dafdaf"),
                    items: controller.genderOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: kblack, fontSize: 13),
                        ),
                      );
                    }).toList(),
                    decoration: infoFieldDecoration(hintText: 'Please Select'),
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
              counselorFields(
                fieldItem: 'Your Current Status',
                textfiled: TextFormField(
                  controller: controller.statusController,
                  readOnly: true,
                  onTap: userDetails?.userRole != null
                      ? null
                      : () => showStatusSheet(context),
                  validator: (value) => controller.fieldValidation(value),
                  onChanged: (value) => controller.checkAllFileds(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: infoFieldDecoration(
                    hintText: 'Please Select',
                    suffixWidget: Icon(Icons.keyboard_arrow_down,
                        size: 26, color: kblack),
                  ),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              counselorFields(
                fieldItem: 'Mobile Number',
                textfiled: TextFormField(
                  readOnly: user?.phone != null,
                  controller: controller.mobileController,
                  validator: (value) => controller.mobileValidation(value),
                  onChanged: (value) => controller.checkAllFileds(),
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  keyboardType: TextInputType.phone,
                  decoration: infoFieldDecoration(
                    hintText: 'Enter Mobile Number',
                    prefix: phoneIcon(),
                  ),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              hLBox,
              GetBuilder<CounselorPersonalController>(
                id: 'couns-Personal details',
                builder: (c) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      actionContainer(
                        text: 'Cancel',
                        textColor: mainPurple,
                        boxColor: kwhite,
                        borderColor: mainPurple,
                        onTap: () => Get.back(),
                      ),
                      wMBox,
                      actionContainer(
                        text: 'Next',
                        textColor: c.saveText.value,
                        boxColor: c.saveBG.value,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Get.to(() => CounselorEduBackgroundPage());
                          }
                        },
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void initializeFields(
      UserDataModel? details, UserData? user, CounselorPersonalController c) {
    if (user == null) return;
    if (details == null) return;

    c.nameController.text = user.name ?? c.nameController.text;
    c.emailController.text = user.email ?? c.emailController.text;
    c.mobileController.text = user.phone ?? c.mobileController.text;
    c.dobController.text = details.dob ?? c.dobController.text;
    if (details.gender != null && !c.genderOptions.contains(details.gender)) {
      c.genderOptions.add(details.gender!);
    }
    c.selectedGender.value = details.gender ?? c.selectedGender.value;
    c.statusController.text = details.userRole ?? c.statusController.text;
    c.checkAllFileds();
    c.update(['couns-Personal details']);
  }

  void showStatusSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const CounselorStatusSheet(),
    );
  }
}
