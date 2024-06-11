import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';

Widget sendcard(context, String mssg, String time) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        child: Container(
          decoration: BoxDecoration(
            color: mainPurple,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topLeft: Radius.circular(5)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Text(
              mssg,
              style: TextStyle(color: kwhite),
            ),
          ),
        ),
      ),
      Text(time, style: TextStyle(fontSize: 10, color: textFieldColor)),
      hBox,
    ],
  );
}

Widget replaycard(context, String mssg, String time, {bool? type}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 28,
        width: 28,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 223, 169),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(140),
              bottomRight: Radius.circular(140),
              topRight: Radius.circular(140)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/person.png'),
          ),
        ),
      ),
      wBox,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: type != null ? null : double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 241, 242, 246),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: Text(
                  mssg,
                  style: TextStyle(color: textFieldColor),
                ),
              ),
            ),
            Text(time, style: TextStyle(fontSize: 10, color: textFieldColor)),
            // hBox,
          ],
        ),
      ),
    ],
  );
}


// constraints: BoxConstraints(
// maxWidth: MediaQuery.of(context).size.width * 0.7,
//),