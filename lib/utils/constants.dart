import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// figma size
Size designSize = const Size(414, 932);

double pH(val, context) {
  return val * MediaQuery.sizeOf(context).height / designSize.height;
}

double pW(val, context) {
  return val * MediaQuery.sizeOf(context).width / designSize.width;
}

void showSnack(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(message),
    duration: const Duration(seconds: 3),
  ));
}

const kenyaObj = {
  "e164_cc": "254",
  "iso2_cc": "KE",
  "e164_sc": 0,
  "geographic": true,
  "level": 1,
  "name": "Kenya",
  "example": "712123456",
  "display_name": "Kenya (KE) [+254]",
  "full_example_with_plus_sign": "+254712123456",
  "display_name_no_e164_cc": "Kenya (KE)",
  "e164_key": "254-KE-0"
};

String countryCodeToEmojiLocal(String countryCode) {
// 0x41 is Letter A
// 0x1F1E6 is Regional Indicator Symbol Letter A
// Example :
// firstLetter U => 20 + 0x1F1E6
// secondLetter S => 18 + 0x1F1E6
// See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
  final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
  final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
  return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
}

Widget flagImage(Country country) {
  final String url =
      "https://www.countryflagicons.com/FLAT/64/${country.countryCode}.png";
  return Image.network(
    url,
    width: const CountryListThemeData().flagSize ?? 22,
    errorBuilder: (_, __, ___) => emojiTextLocal(country),
  );
}

Widget emojiTextLocal(Country country) => Text(
      country.iswWorldWide
          ? '\uD83C\uDF0D'
          : countryCodeToEmojiLocal(country.countryCode),
      style: TextStyle(
        fontSize: const CountryListThemeData().flagSize ?? 20,
      ),
    );
String formatDateTime(dt) {
  // Given date-time string
  String dateTimeStr = "2024-06-13T17:14:39.000000Z";

  // Parse the string to a DateTime object
  DateTime dateTime = DateTime.parse(dt);

  // Format the DateTime object to the desired output
  String formattedDate = DateFormat.jm().add_yMMM().format(dateTime);

  return formattedDate; // Returns "2:39 pm Jun 13"
}
