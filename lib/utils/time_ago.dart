import 'package:get/get.dart';

String timeAgo(DateTime? date) {
  if (date == null) {
    return '';
  }
  final date2 = DateTime.now();
  final difference = date2.difference(date);
  if ((difference.inDays / 365).floor() >= 2) {
    return '${(difference.inDays / 365).floor()} ${'ago_years'.tr}';
  } else if ((difference.inDays / 365).floor() >= 1) {
    return 'ago_last_year'.tr;
  } else if ((difference.inDays / 30).floor() >= 2) {
    return '${(difference.inDays / 30).floor()} ${'ago_months'.tr}';
  } else if ((difference.inDays / 30).floor() >= 1) {
    return 'ago_last_month'.tr;
  } else if ((difference.inDays / 7).floor() >= 2) {
    return '${(difference.inDays / 7).floor()} ${'ago_weeks'.tr}';
  } else if ((difference.inDays / 7).floor() >= 1) {
    return 'ago_last_week'.tr;
  } else if (difference.inDays >= 2) {
    return '${difference.inDays} ${'ago_days'.tr}';
  } else if (difference.inDays >= 1) {
    return 'ago_yesterday'.tr;
  } else if (difference.inHours >= 2) {
    return '${difference.inHours} ${'ago_hours'.tr}';
  } else if (difference.inHours >= 1) {
    return 'ago_an_hour'.tr;
  } else if (difference.inMinutes >= 2) {
    return '${difference.inMinutes} ${'ago_minutes'.tr}';
  } else if (difference.inMinutes >= 1) {
    return 'ago_a_minute'.tr;
  } else if (difference.inSeconds >= 3) {
    return '${difference.inSeconds} ${'ago_seconds'.tr}';
  } else {
    return 'ago_just_now'.tr;
  }
}
