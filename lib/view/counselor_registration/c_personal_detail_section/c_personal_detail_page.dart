import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';

class CounselorPersonalSection extends StatelessWidget {
  const CounselorPersonalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counselor Registration',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: kblack, fontSize: 12),
        ),
        centerTitle: true,
        surfaceTintColor: Colors.white,
        elevation: 7,
        // automaticallyImplyLeading: true,
        shadowColor: Colors.black.withOpacity(0.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/careerbgimage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [],),
      ),
    );
  }
}
