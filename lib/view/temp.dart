

import 'package:flutter/material.dart';

class SampleDate extends StatefulWidget {
  const SampleDate({super.key});

  @override
  State<SampleDate> createState() => _SampleDateState();
}

class _SampleDateState extends State<SampleDate> {
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
              // selectedDate.toString().split(" ")[0],
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => selectDate(context),
              child: const Text('Select date'),
            ),
          ],
        ),
      ),
    );
  }
}
