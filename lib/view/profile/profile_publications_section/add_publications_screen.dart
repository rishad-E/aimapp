import 'package:aimshala/controllers/profile_controller/profile_publications_controller.dart';
import 'package:aimshala/models/profile_model/profile_section_data_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/widgets.dart';
import 'package:aimshala/view/profile/profile_home/profile_home.dart';
import 'package:aimshala/view/profile/profile_publications_section/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
      initializeFormField(controller, publication);
      pbID = publication?.id.toString();
    });
    return PopScope(
      onPopInvoked: (didPop) =>
          Future.microtask(() => Get.off(() => ProfileHomeScreen(id: uId))),
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
                              hintText: 'Ex: Harvard Business Review'),
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
                                saveContainer(
                                  boxColor: kwhite,
                                  borderColor: mainPurple,
                                  child: saveContainerText(
                                    text: 'Cancel',
                                    textColor: mainPurple,
                                  ),
                                  onTap: () => Get.back(),
                                ),
                                wMBox,
                                saveContainer(
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
                                  child: Obx(
                                    () => c.isSaving.value
                                        ? CircularProgressIndicator(
                                            color: kwhite,
                                            strokeWidth: 1,
                                          )
                                        : saveContainerText(
                                            text: 'Save',
                                            textColor: c.titleController.text
                                                        .isNotEmpty &&
                                                    c.publicationController.text
                                                        .isNotEmpty &&
                                                    c.publicationDateController
                                                        .text.isNotEmpty &&
                                                    c.publicationURLController
                                                        .text.isNotEmpty &&
                                                    c.publicationDescriptionController
                                                        .text.isNotEmpty
                                                ? kwhite
                                                : textFieldColor,
                                          ),
                                  ),
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      publication == null
                                          ? c.savePublicationFuntion(
                                              uId: uId,
                                              title: c.titleController.text,
                                              publication:
                                                  c.publicationController.text,
                                              pubDate: c.publishDate.toString(),
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
                                              pubDate: c.publishDate.toString(),
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
                      hBox,
                      publication == null
                          ? shrinked
                          : deleteSectionWidget(
                              onPressed: () =>
                                  controller.deletePublicationFuntion(
                                      pbID: pbID.toString(), uId: uId),
                              section: 'Publication',
                            )
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

  void initializeFormField(ProfilePublicationController c, Publication? pub) {
    if (pub == null) return;

    c.titleController.text = pub.title ?? c.titleController.text;
    c.publicationController.text =
        pub.publication ?? c.publicationController.text;
    c.publicationDateController.text = convertDateFormat(pub.publicationDate!);
    c.publicationURLController.text =
        pub.publicationUrl ?? c.publicationURLController.text;
    c.publicationDescriptionController.text =
        pub.description ?? c.publicationDescriptionController.text;
    c.publishDate = pub.publicationDate;
    c.update(['update-publication']);
  }

  String convertDateFormat(String date) {
    try {
      DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(date);
      String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDate);
      return formattedDate;
    } catch (e) {
      return 'Invalid date';
    }
  }
}
