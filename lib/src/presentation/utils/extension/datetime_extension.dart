import 'package:intl/intl.dart';

extension DateTimeEx on DateTime {
  String dayOfWeekend() => DateFormat('EEE').format(this);


  String nameOfMonth() => DateFormat('MMM').format(this);

  String dateYMMMMDFormat() => DateFormat.yMMMMd().format(this);

  String dateJMFormat() => DateFormat.jm().format(this);
}