import 'package:flutter/material.dart';

typedef ButtonClick = void Function();


/// Signature for a function that detects when a tap is occurred.
///
/// Used by [DatePickerTimeline] for tap detection.
typedef DateSelectionCallback = void Function(DateTime selectedDate);

/// Signature for a function that is called when selected date is changed
///
/// Used by [DatePickerTimeline] for tap detection.
typedef DateChangeListener = void Function(DateTime selectedDate);



class AppColors {
  AppColors._();

  static const Color defaultDateColor = Colors.black;
  static const Color defaultDayColor = Colors.black;
  static const Color defaultMonthColor = Colors.black;
  static const Color defaultSelectionColor = Color(0x30000000);
}

const TextStyle defaultMonthTextStyle = TextStyle(
  color: AppColors.defaultMonthColor,
  fontSize: Dimen.monthTextSize,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

const TextStyle defaultDateTextStyle = TextStyle(
  color: AppColors.defaultDateColor,
  fontSize: Dimen.dateTextSize,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

const TextStyle defaultDayTextStyle = TextStyle(
  color: AppColors.defaultDayColor,
  fontSize: Dimen.dayTextSize,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);


class Dimen {
  Dimen._();

  static const double dateTextSize = 24;
  static const double dayTextSize = 11;
  static const double monthTextSize = 11;
}