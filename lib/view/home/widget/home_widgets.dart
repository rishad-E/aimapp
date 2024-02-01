import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';

ShapeBorder appBarBorder() {
  return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(15),
    bottomRight: Radius.circular(15),
  ));
}

PreferredSizeWidget appbarc() {
  return AppBar(
    toolbarHeight: 70,
    // backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    shape: appBarBorder(),
    leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
    title: primarytxt3('Hi,Sachin', 18),
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_active_outlined,
            size: 26,
          )),
      const SizedBox(
        // color: Colors.yellow,
        height: 26,
        width: 26,
        // child: SvgPicture.asset(
        //   'assets/images/Vector.svg',
        // ),
        // child: Image.asset('assets/images/person.png',fit: BoxFit.cover,),
      ),
      wBox,
      const SizedBox(
        height: 26,
        width: 26,
        // color: Colors.red,
        // child: Image.asset('assets/images/person2.png'),
        // child: SvgPicture.asset('assets/images/Vector.svg'),
      ),
      wMBox
    ],
  );
}

Widget headersHome({String? text1, String? text2, Color? divColor}) {
  return Row(
    children: [
      SizedBox(
        height: 30,
        width: 0,
        child: VerticalDivider(
          thickness: 3,
          color: divColor ?? Colors.yellow,
          
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: text1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color.fromARGB(255, 30, 35, 44),
                  )),
              WidgetSpan(child: wBox),
              TextSpan(
                  text: text2,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 30, 35, 44),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
            ],
          ),
        ),
      ),
      const Expanded(
        child: Divider(
          color: Colors.yellow,
          thickness: 3,
        ),
      ),
    ],
  );
}
