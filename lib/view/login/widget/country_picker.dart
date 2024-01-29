import 'package:aimshala/utils/common/colors_common.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {
  final Function(String) onCountrySelected;
  const CountryPicker({super.key, required this.onCountrySelected});
  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  Country? country;
  void showPicker() {
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
          bottomSheetHeight: 600, borderRadius: BorderRadius.circular(16)),
      onSelect: (Country? selectedCountry) {
        if (selectedCountry != null) {
          setState(() {
            country = selectedCountry;
            widget.onCountrySelected(selectedCountry.phoneCode);
          });
        }
      },
    );
  }

    String getCountryCode() {
    return country?.phoneCode ?? ''; // Return empty string if no country is selected
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        textAlign: TextAlign.center,
        country != null ? '+${country?.phoneCode}' : '+91  ',
        style:  TextStyle(fontWeight: FontWeight.w400, fontSize: 17,color: kblack.withOpacity(0.6)),
      ),
      onTap: () => showPicker(),
    );
  }
}
