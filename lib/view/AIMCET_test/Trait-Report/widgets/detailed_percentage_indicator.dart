import 'package:aimshala/models/AIMCET_TEST/Trait_model/trait_report_model.dart';
import 'package:aimshala/utils/common/colors_common.dart';
import 'package:aimshala/view/AIMCET_test/Trait-Report/widgets/trait_widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TraitPercentageIndicatorDetailed extends StatelessWidget {
  final DetailedPersonality? detailedPersonality;
  const TraitPercentageIndicatorDetailed(
      {super.key, required this.detailedPersonality});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: dataContainer(data: "Leadership"),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  color:
                      const Color.fromARGB(76, 216, 216, 216).withOpacity(0.2),
                  child: SizedBox(
                    child: LinearPercentIndicator(
                      center: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '${detailedPersonality!.leadership.toString()}%',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: kwhite),
                          ),
                        ),
                      ),
                      barRadius: const Radius.circular(20),
                      lineHeight: 17,
                      percent:
                          convert(detailedPersonality!.leadership.toString()),
                      progressColor: const Color.fromARGB(255, 247, 37, 133),
                      backgroundColor: kwhite,
                      animation: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: dataContainer(data: "Concern for Others"),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  color:
                      const Color.fromARGB(76, 216, 216, 216).withOpacity(0.2),
                  child: SizedBox(
                    child: LinearPercentIndicator(
                      center: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '${detailedPersonality!.concernForOthers.toString()}%',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: kwhite),
                          ),
                        ),
                      ),
                      barRadius: const Radius.circular(20),
                      lineHeight: 17,
                      percent:
                          convert(detailedPersonality!.leadership.toString()),
                      progressColor: const Color.fromARGB(255, 0, 180, 216),
                      backgroundColor: kwhite,
                      animation: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: dataContainer(data: "Dependability"),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  color:
                      const Color.fromARGB(76, 216, 216, 216).withOpacity(0.2),
                  child: SizedBox(
                    child: LinearPercentIndicator(
                      center: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '${detailedPersonality!.dependability.toString()}%',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: kwhite),
                          ),
                        ),
                      ),
                      barRadius: const Radius.circular(20),
                      lineHeight: 17,
                      percent:
                          convert(detailedPersonality!.leadership.toString()),
                      progressColor: const Color.fromARGB(255, 59, 0, 154),
                      backgroundColor: kwhite,
                      animation: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: dataContainer(data: "Tolerance of Stress and Criticism"),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 13),
                  // color: Colors.yellow,
                  color:
                      const Color.fromARGB(76, 216, 216, 216).withOpacity(0.2),
                  child: SizedBox(
                    child: LinearPercentIndicator(
                      center: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '${detailedPersonality!.toleranceOfStressAndCriticism.toString()}%',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: kwhite,
                            ),
                          ),
                        ),
                      ),
                      barRadius: const Radius.circular(20),
                      lineHeight: 17,
                      percent:
                          convert(detailedPersonality!.leadership.toString()),
                      progressColor: const Color.fromARGB(255, 181, 23, 158),
                      backgroundColor: kwhite,
                      animation: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  double convert(String value) {
    double parsedValue = double.parse(value);
    double percentage = parsedValue / 100;
    return percentage;
  }
}
