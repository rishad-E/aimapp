import 'package:aimshala/models/profile_model/add_media_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/common/widgets/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/profile/common/widgets/texts.dart';
import 'package:aimshala/view/profile/profile_home/widgets/profile_media_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

Widget buildProfileImage({
  required double profileHeight,
  required void Function()? onPressed,
  ImageProvider<Object>? image,
}) {
  return Stack(
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
}

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

Widget contactInfos(
    {required String text,
    required String svg,
    double? height,
    double? width,
    required BoxFit fit}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height ?? 20,
          width: width ?? 20,
          child: SvgPicture.asset(
            svg,
            fit: fit,
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

Widget sectionDataWidget({
  required String image,
  required String secTitle,
  required String secSubTitle,
  required String secSubTitle2,
  required String secSubTitle3,
  required String secSubTitle4,
  required String secSubTitle5,
  required bool end,
  Color? color,
  dynamic data,
}) {
  String? mediaUrl;
  List<AddMediaModel> mediaItems = profileEducationMediaFunctions(data);
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
                secSubTitle3 == 'no'
                    ? shrinked
                    : regularText(secSubTitle3, 8.sp),
                secSubTitle4 == 'no'
                    ? shrinked
                    : regularText(secSubTitle4, 8.sp),
                secSubTitle5 == 'no'
                    ? shrinked
                    : regularText(
                        secSubTitle5,
                        8.sp,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                Column(
                  children: List.generate(mediaItems.length, (index) {
                    if (data?.media != null && data?.imagePath != null) {
                      mediaUrl =
                          "http://154.26.130.161/elearning/${data?.imagePath}/${mediaItems[index].url}";
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Container(
                              height: 6.h,
                              width: 20.w,
                              color: Colors.grey.shade200,
                              child: mediaItems[index].url != null
                                  ? Image.network(
                                      mediaUrl!,
                                      fit: BoxFit.fill,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      mainPurple),
                                              strokeWidth: 1.5,
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        }
                                      },
                                    )
                                  : Image.asset(
                                      image,
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          wBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                regularText(mediaItems[index].title, 8.sp),
                                regularText(
                                  mediaItems[index].description,
                                  8,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
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

Widget loadingWidget(double defaultPadding) {
  return Column(
    children: List.generate(
      2,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          children: [
            Skeleton(height: 120, width: 120, defaultPadding: defaultPadding),
            SizedBox(width: defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(width: 80, defaultPadding: defaultPadding),
                  SizedBox(height: defaultPadding / 2),
                  Skeleton(defaultPadding: defaultPadding),
                  SizedBox(height: defaultPadding / 2),
                  Skeleton(defaultPadding: defaultPadding),
                  SizedBox(height: defaultPadding / 2),
                  Row(
                    children: [
                      Expanded(
                        child: Skeleton(defaultPadding: defaultPadding),
                      ),
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: Skeleton(defaultPadding: defaultPadding),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
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

class Skeleton extends StatelessWidget {
  const Skeleton(
      {Key? key, this.height, this.width, required this.defaultPadding})
      : super(key: key);

  final double? height, width;
  final double defaultPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.all(Radius.circular(defaultPadding))),
    );
  }
}
