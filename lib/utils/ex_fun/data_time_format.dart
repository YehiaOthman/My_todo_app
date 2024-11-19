import 'package:intl/intl.dart';
extension DateEx on DateTime{
  String get dateFormater => '$day / $month / $year';

  String get dayName {
    DateFormat formatter = DateFormat('E');
    return formatter.format(this);
  }
}
