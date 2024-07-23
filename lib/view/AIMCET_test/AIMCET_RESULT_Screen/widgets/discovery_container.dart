import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DiscoveryContainer extends StatelessWidget {
  final String personality;
  final String image;
  const DiscoveryContainer({
    super.key,
    required this.personality,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      margin: const EdgeInsets.only(right: 11),
      width: 39.5.w,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        // borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          personality,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class DiscoveryShareContainer extends StatelessWidget {
  const DiscoveryShareContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37.h,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      decoration: const BoxDecoration(
        // color: Colors.yellow,
        image: DecorationImage(
          image: AssetImage('assets/images/assetFrameShare.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
