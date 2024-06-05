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
      margin: const EdgeInsets.only(right: 10),
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
