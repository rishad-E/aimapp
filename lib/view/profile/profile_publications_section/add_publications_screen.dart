import 'package:aimshala/controllers/profile_controller/profile_publications_controller.dart';
import 'package:aimshala/models/profile_model/profile_all_data_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_publications_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileAddPublicationScreen extends StatelessWidget {
  final String uId;
  final Publication? publication;
  ProfileAddPublicationScreen({super.key, required this.uId, this.publication});
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfilePublicationController());
    String? pbID;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.titleController.text =
          publication?.title.toString() ?? controller.titleController.text;
      controller.publicationController.text =
          publication?.publication.toString() ??
              controller.publicationController.text;
      controller.publicationDateController.text =
          publication?.publicationDate.toString() ??
              controller.publicationDateController.text;
      controller.publicationURLController.text =
          publication?.publicationUrl.toString() ??
              controller.publicationURLController.text;
      controller.publicationDescriptionController.text =
          publication?.description.toString() ??
              controller.publicationDescriptionController.text;
      pbID = publication?.id.toString();
      controller.update(['update-publication']);
    });
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => const ProfileHomeScreen())),
      child: Scaffold(
        appBar: profileAppBar(title: 'Add Publications', doneWidget: shrinked),
        body: Container(
          decoration: profileMainContainer(),
          child: Center(
            child: Container(
              decoration: profileSecondaryContainer(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      profileRichText('Add', 'Publications'),
                      hBox,
                      Text(
                        "Tell us about your Publications",
                        style: TextStyle(fontSize: 14, color: textFieldColor),
                      ),
                      hLBox,
                      publicationsInfoFiled(
                        text: primarytxt3('Title', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.titleController,
                          validator: (value) =>
                              controller.filedValidation(value),
                          onChanged: (value) =>
                              controller.update(['update-publication']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Ex: Giving and receiving feedback',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      publicationsInfoFiled(
                        text: primarytxt3('Publication/Publisher', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.publicationController,
                          validator: (value) =>
                              controller.filedValidation(value),
                          onChanged: (value) =>
                              controller.update(['update-publication']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                              hintText: 'Ex: Harvard Business Review',
                              suffixWidget:
                                  const Icon(Icons.keyboard_arrow_down)),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      publicationsInfoFiled(
                        text: primarytxt3('Publication date', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.publicationDateController,
                          validator: (value) =>
                              controller.filedValidation(value),
                          onChanged: (value) =>
                              controller.update(['update-publication']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: true,
                          decoration: infoFieldDecoration(
                              hintText: 'Date',
                              suffixWidget: GestureDetector(
                                onTap: () => controller.datePicker(context),
                                child: SvgPicture.asset(
                                    'assets/images/calendar-booked.svg',
                                    colorFilter: ColorFilter.mode(
                                        kblack, BlendMode.srcIn),
                                    fit: BoxFit.scaleDown),
                              )),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      publicationsInfoFiled(
                        text: primarytxt3('Publication URL', 9.5.sp),
                        textField: TextFormField(
                          controller: controller.publicationURLController,
                          validator: (value) =>
                              controller.filedValidation(value),
                          onChanged: (value) =>
                              controller.update(['update-publication']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Enter Publication URL',
                          ),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      publicationsInfoFiled(
                        text: primarytxt3('Description', 9.5.sp),
                        textField: TextFormField(
                          controller:
                              controller.publicationDescriptionController,
                          validator: (value) =>
                              controller.filedValidation(value),
                          onChanged: (value) =>
                              controller.update(['update-publication']),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: infoFieldDecoration(
                            hintText: 'Enter Description',
                          ),
                          maxLength: 2000,
                          minLines: 2,
                          maxLines: null,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      hMBox,
                      GetBuilder<ProfilePublicationController>(
                          id: 'update-publication',
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
                                  text: 'Save',
                                  textColor:
                                      c.titleController.text.isNotEmpty &&
                                              c.publicationController.text
                                                  .isNotEmpty &&
                                              c.publicationDateController.text
                                                  .isNotEmpty &&
                                              c.publicationURLController.text
                                                  .isNotEmpty &&
                                              c.publicationDescriptionController
                                                  .text.isNotEmpty
                                          ? kwhite
                                          : textFieldColor,
                                  boxColor: c.titleController.text.isNotEmpty &&
                                          c.publicationController.text
                                              .isNotEmpty &&
                                          c.publicationDateController.text
                                              .isNotEmpty &&
                                          c.publicationURLController.text
                                              .isNotEmpty &&
                                          c.publicationDescriptionController
                                              .text.isNotEmpty
                                      ? mainPurple
                                      : buttonColor,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      publication == null
                                          ? c.savePublicationFuntion(
                                              uId: uId,
                                              title: c.titleController.text,
                                              publication:
                                                  c.publicationController.text,
                                              pubDate: c
                                                  .publicationDateController
                                                  .text,
                                              pubURL: c.publicationURLController
                                                  .text,
                                              pubDescription: c
                                                  .publicationDescriptionController
                                                  .text,
                                            )
                                          : c.updatePublicationFuntion(
                                              pbID: pbID.toString(),
                                              uId: uId,
                                              title: c.titleController.text,
                                              publication:
                                                  c.publicationController.text,
                                              pubDate: c
                                                  .publicationDateController
                                                  .text,
                                              pubURL: c.publicationURLController
                                                  .text,
                                              pubDescription: c
                                                  .publicationDescriptionController
                                                  .text,
                                            );
                                    }
                                  },
                                ),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
