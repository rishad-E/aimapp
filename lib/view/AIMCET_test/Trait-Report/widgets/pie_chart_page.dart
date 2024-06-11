import 'package:aimshala/models/AIMCET_TEST/Trait_model/trait_report_model.dart';
import 'package:aimshala/utils/common/widgets/colors_common.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class TraitPieChart extends StatelessWidget {
  final Riasec? riasec;
  const TraitPieChart({Key? key, required this.riasec}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, double> data = {
      "Realistic": double.parse(riasec!.realistic.toString()),
      "Investigative": double.parse(riasec!.investigative.toString()),
      "Artistic": double.parse(riasec!.artistic.toString()),
      "Social": double.parse(riasec!.social.toString()),
      "Enterprising": double.parse(riasec!.enterprising.toString()),
      "Conventional": double.parse(riasec!.conventional.toString()),
    };

    return Scaffold(
      body: Center(
        child: PieChart(
          dataMap: data,
          legendOptions: const LegendOptions(showLegends: false),
          // chartRadius: MediaQuery.of(context).size.width/1.2,
          chartValuesOptions: ChartValuesOptions(
            showChartValues: true,
            decimalPlaces: 0,
            showChartValuesInPercentage: true,
            chartValueBackgroundColor: Colors.transparent,
            chartValueStyle: TextStyle(
              color: kwhite,
              fontSize: 12,
            ),
          ),
          colorList: _getColorList(data.keys.toList()),
        ),
      ),
    );
  }

  List<Color> _getColorList(List<String> labels) {
    List<Color> colors = [];
    for (String label in labels) {
      if (label == "Realistic") {
        colors.add(const Color.fromARGB(255, 2, 213, 255)); // Realistic color
      } else if (label == "Investigative") {
        colors
            .add(const Color.fromARGB(255, 46, 0, 119)); // Investigative color
      } else if (label == "Artistic") {
        colors.add(const Color.fromARGB(255, 46, 147, 250)); // Artistic color
      } else if (label == "Social") {
        colors.add(const Color.fromARGB(255, 181, 23, 158)); // Social color
      } else if (label == "Enterprising") {
        colors
            .add(const Color.fromARGB(255, 86, 11, 173)); // Enterprising color
      } else if (label == "Conventional") {
        colors
            .add(const Color.fromARGB(255, 144, 9, 183)); // Conventional color
      }
    }
    return colors;
  }
}
