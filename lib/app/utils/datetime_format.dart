import 'package:intl/intl.dart';

extension DateTimeStringer on DateTime {
  get toDDMMMDay => DateFormat('dd MMM, EEEE').format(this);
  get toyyyyMMddWithDashSeperator => DateFormat('yyyy-MM-dd').format(this);
}
