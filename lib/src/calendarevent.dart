import 'package:flutter/material.dart';

/// One day duration to use in the rest of the system.
const Duration oneDay = const Duration(days: 1);

abstract class CalendarEventElement {
  void updateEvents();

  void scrollToDate(DateTime time);
}

/// The type of the calendar view to show.  Right now only schedule is
/// implemented.
enum CalendarViewType { Schedule, Week, Month }

///
/// The calendar event to display in the calendar.  This contains details
/// about how to render it and display it.
///
class CalendarEvent<E> {
  CalendarEvent({
    @required this.date,
    this.event,
  });
  DateTime date;
  E event;

  static const int YEAR_OFFSET = 12 * 31;
  static const int MONTH_OFFSET = 31;

  static int indexFromMilliseconds(DateTime time) {
    return time.year * YEAR_OFFSET +
        (time.month - 1) * MONTH_OFFSET +
        time.day -
        1;
  }

  @override
  String toString() {
    return 'CalendarEvent{instant: $date, event: $event}';
  }
}
