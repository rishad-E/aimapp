import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

Widget buildTopContent(
    {required double bottom,
    required double coverHeight,
    required double top,
    required double profileHeight,
    required Widget profilePicWidget}) {
  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(bottom: bottom),
        child: Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/profile-bg.png',
            width: double.infinity,
            height: coverHeight,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(top: top, child: profilePicWidget),
    ],
  );
}

Widget buildProfileImage(
        {required double profileHeight,
        required void Function()? onPressed,
        ImageProvider<Object>? image}) =>
    Stack(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: kwhite),
          padding: const EdgeInsets.all(3),
          child: CircleAvatar(
            radius: profileHeight / 2,
            backgroundColor: kwhite,
            backgroundImage: image,
          ),
        ),
        Positioned(
          top: profileHeight / 1.4,
          left: profileHeight / 1.3,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kwhite,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1.2),
                ),
              ],
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.camera_alt,
                color: kblack,
              ),
            ),
          ),
        ),
      ],
    );
Widget infoContainer({required Widget child}) => Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: kwhite),
      child: child,
    );
Widget infoText({required String text1, required String text2}) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: text1,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.5.sp,
                  color: const Color.fromARGB(255, 30, 35, 44),
                )),
            WidgetSpan(child: wBox),
            TextSpan(
                text: text2,
                style: TextStyle(
                  color: const Color.fromARGB(255, 30, 35, 44),
                  fontSize: 10.5.sp,
                  // fontWeight: FontWeight.,
                )),
          ],
        ),
      ),
    );

Widget infoHeading(String text) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 12.5.sp, color: kpurple, fontWeight: FontWeight.w600),
  );
}

Widget contactInfos({required String text, required String svg}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: SvgPicture.asset(
            svg,
            colorFilter: ColorFilter.mode(kpurple, BlendMode.srcIn),
          ),
        ),
        wBox,
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        )
      ],
    ),
  );
}

Widget profileNodataContainer(
        {required String headingText,
        required String subText,
        required void Function()? onPressed}) =>
    infoContainer(
      child: Column(
        children: [
          infoHeading(headingText),
          hBox,
          Text(
            subText,
            style: const TextStyle(fontSize: 12),
          ),
          TextButton.icon(
            onPressed: onPressed,
            icon: const Text(
              "Add Now",
              style: TextStyle(
                  fontSize: 11,
                  color: Color.fromARGB(255, 15, 187, 195),
                  fontWeight: FontWeight.w600),
            ),
            label: const Icon(
              Icons.add,
              size: 16,
              color: Color.fromARGB(255, 15, 187, 195),
            ),
          )
        ],
      ),
    );
Widget profileDataContainer(
    {required String section,
    void Function()? onTapEdit,
    void Function()? onTapAdd,
    required List<Widget> sectionData,
    required Widget viewAll}) {
  return infoContainer(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            infoHeading(section),
            Row(
              children: [
                GestureDetector(
                  onTap: onTapEdit,
                  child: Icon(
                    Icons.edit,
                    size: 14.sp,
                    color: mainPurple,
                  ),
                ),
                wBox,
                GestureDetector(
                  onTap: onTapAdd,
                  child: Icon(
                    Icons.add,
                    size: 17.sp,
                    color: mainPurple,
                  ),
                ),
              ],
            )
          ],
        ),
        hBox,
        ...sectionData,
        viewAll
      ],
    ),
  );
}

Widget sectionDataWidget(
    {required String image,
    required String secTitle,
    required String secSubTitle,
    required String secSubTitle2,
    required String secSubTitle3,
    required String secSubTitle4,
    required String secSubTitle5,
    required bool end,
    Color? color}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 3.7.h,
            width: 8.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: image == "assets/images/upEvent1.png"
                  ? DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    )
                  : DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          wBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                semiBoldChoiceText(
                  text: secTitle,
                  size: 11.sp,
                ),
                regularText(secSubTitle, 9.sp, color: color),
                regularText(secSubTitle2, 8.sp),
                regularText(secSubTitle3, 8.sp),
                regularText(secSubTitle4, 8.sp),
                regularText(
                  secSubTitle5,
                  8,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
      end ? shrinked : const Divider(thickness: .2),
    ],
  );
}

Widget loadingWidget() {
  return infoContainer(
    child: Center(
        child:
            CircularProgressIndicator(strokeWidth: 1, color: textFieldColor)),
  );
}

String getMonthName(DateTime? date) {
  return DateFormat.MMMM().format(date!);
}

Widget viewAllButton({required void Function()? onPressedViewAll}) {
  return TextButton(
    onPressed: onPressedViewAll,
    style: const ButtonStyle(
        visualDensity: VisualDensity.compact,
        padding: MaterialStatePropertyAll(EdgeInsets.zero)),
    child: Text(
      "View All",
      style: TextStyle(
          color: mainPurple, fontWeight: FontWeight.w600, fontSize: 8.5.sp),
    ),
  );
}
