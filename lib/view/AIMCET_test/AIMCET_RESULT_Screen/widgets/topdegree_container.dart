import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:flutter/material.dart';

class TopDegreeContainer extends StatelessWidget {
  final String degreeImage;
  final String degree;
  final String degreeCap;
  const TopDegreeContainer({super.key,required this.degreeImage,required this.degree,required this.degreeCap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      // width: 53.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromARGB(255, 221, 220, 220),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(degreeImage),
                  fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(11),
                  bottomLeft: Radius.circular(11)),
            ),
            height: 71,
            width: 71,
            child: Center(
              child: CircleAvatar(
                radius: 17,
                backgroundColor: const Color.fromARGB(255, 231, 230, 240),
                // child: SvgPicture.asset(degreeCap,color: Colors.red,fit: BoxFit.fill,),
                child: Image.asset(degreeCap),
              ),
            ),
          ),
          wBox,
           Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Text(
                degree,
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
