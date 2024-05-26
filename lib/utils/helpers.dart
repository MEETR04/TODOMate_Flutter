import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Helpers {
  Helpers._();

  static String timetoString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date =
          DateTime(now.year, now.month, now.day, time.hour, time.minute);

      // Formatting the date to display just the time in AM/PM format
      return DateFormat.jm().format(date);
    } catch (e) {
      return "Meet time";
    }
  }
}
