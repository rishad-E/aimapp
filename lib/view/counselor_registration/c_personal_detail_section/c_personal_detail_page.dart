import 'package:aimshala/controllers/counselor_controllers/counselor_personal_controller.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/counselor_registration/c_background_details_section/c_edu_background_detail_page.dart';
import 'package:aimshala/view/counselor_registration/common/widgets/counselor_widgets.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CounselorPersonalSection extends StatelessWidget {
  CounselorPersonalSection({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounselorPersonalController());
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
              counselorFields(
                fieldItem: 'Gender',
                textfiled: DropdownButtonFormField<String>(
                  value: controller.selectedGender,
                  icon:
                      Icon(Icons.keyboard_arrow_down, size: 26, color: kblack),
                  onChanged: (newValue) {
                    controller.selectedGender = newValue;
                    controller.checkAllFileds();
                  },
                  validator: (value) => controller.fieldValidation(value),
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
              counselorFields(
                fieldItem: 'Your Current Status',
                textfiled: TextFormField(
                  controller: controller.statusController,
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
                            Get.to(() =>  CounselorEduBackgroundPage());
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
}
