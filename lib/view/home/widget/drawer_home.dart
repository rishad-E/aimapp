import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    return Drawer(
      backgroundColor: kwhite,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: Column(
                children: [
                  DrawerHeader(
                    child: Image.asset('assets/images/aimshala-logo.png'),
                  ),
                  DrawerTile(
                    ontap1: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // backgroundColor:
                              // const Color.fromARGB(223, 43, 9, 53),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              title: Text(
                                'SIGN OUT',
                                style: TextStyle(
                                    color: kblack.withOpacity(0.6),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              content: Text(
                                'Are You Sure Want To Sign Out',
                                style: TextStyle(
                                    color: textFieldColor, fontSize: 16),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () async {
                                          storage.deleteAll();
                                          Get.offAll(
                                              () => const SplashScreen());
                                        },
                                        child: Text(
                                          'Sign Out',
                                          style:
                                              TextStyle(color: kpurple),
                                        )),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(color: kpurple),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    icon1: Icons.logout_outlined,
                    text1: "Sign Out",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String text1;
  final IconData icon1;
  final void Function() ontap1;
  const DrawerTile(
      {super.key,
      required this.ontap1,
      required this.icon1,
      required this.text1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white24,
        ),
        height: MediaQuery.of(context).size.height * 0.07,
        width: double.infinity,
        child: ListTile(
          iconColor: kblack,
          textColor: textFieldColor,
          leading: Icon(icon1),
          title: Text(
            text1,
          ),
          onTap: ontap1,
        ),
      ),
    );
  }
}
