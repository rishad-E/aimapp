import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/utils/common/text_common.dart';
import 'package:aimshala/utils/widgets/widgets_common.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/career_colors.dart';
import 'package:aimshala/view/Book_career_counsell/widgets/career_home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BookCareerAimPage extends StatelessWidget {
  const BookCareerAimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        // title: appbarContainer(onPressed: () {}),
        title: const Text(
          "Book Career Counselling Call",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-image.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Form(
              // key: careerFormKey,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 24),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kwhite,
                ),
                child: Column(
                  children: [
                    boldText(text: "What is your Aim? ", size: 20),
                    hLBox,
                    careerHomeField(
                      text: primarytxt3('Your Aim', 11),
                      textField: TextFormField(
                        style: TextStyle(fontSize: 14, color: textFieldColor),
                        decoration: careerTextFiled(
                          hintText: 'Tell us your Aim',
                          prefixWidget: Icon(
                            Icons.search_rounded,
                            size: 20,
                            color: kblack,
                          ),
                        ),
                      ),
                    ),
                    hLBox,
                    AbsorbPointer(
                      child: careerHomeField(
                        text: primarytxt3('Your Micro Aim', 11),
                        textField: TextFormField(
                          style:
                              TextStyle(fontSize: 14, color: textFieldColor),
                          decoration: careerTextFiled(
                            hintText: 'Tell us your Micro Aim',
                            prefixWidget: Icon(
                              Icons.search_rounded,
                              size: 20,
                              color: kblack,
                            ),
                          ),
                          readOnly: true,
                        ),
                      ),
                    ),
                    hBox,
                    hLBox,
                    Container(
                        width: double.infinity,
                        height: 4.5.h,
                        decoration: boxdecoration(12),
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: buttonShape(round: 8),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) {
                                return buttonColor;
                              },
                            ),
                          ),
                          child: const Text("Next"),
                        )),
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
