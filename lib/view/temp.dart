import 'package:flutter/material.dart';

class TempScreen extends StatelessWidget {
  final List<String> microAim;
  const TempScreen({super.key, required this.microAim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(microAim.toString()),
      ),
    );
  }
}
