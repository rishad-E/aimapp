import 'package:flutter/material.dart';

class TempScreen extends StatelessWidget {
  // final List<String> microAim;
  final String time;
  final String date;
  const TempScreen({super.key, required this.time, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temp Screen"),
        centerTitle: true,
      ),
      body: Center(
          child: SizedBox(
        height: 100,
        width: 200,
        // color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('selected Time: $time'),
            Text('selected Date: $date'),
          ],
        ),
      )),
    );
  }
}
