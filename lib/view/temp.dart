import 'package:aimshala/view/BookCareerCounsellCall/career_home_aimScreen/widgets/career__widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Temp Screen"),
        centerTitle: true,
      ),
      body: Container(
        decoration: careerMainContainerdecoration(),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 61.w,
                height: 7.h,
                child: Image.asset('assets/images/aimshala-logo.png'),
              ),
              const SizedBox(height: 12),
              const Text("Slot Booked successfully")
            ],
          ),
        )),
      ),
    );
  }
}
