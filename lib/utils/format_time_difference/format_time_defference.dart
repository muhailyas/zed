import 'package:intl/intl.dart';

String formatTimeDifference(DateTime dateTime) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  if (difference.inMinutes < 1) {
    return "Just now";
  } else if (difference.inHours < 1) {
    return "${difference.inMinutes} min ago";
  } else if (difference.inHours < 24) {
    return "${difference.inHours}h ago";
  } else if (difference.inDays <= 3) {
    return "${difference.inDays} day ago";
  } else if (difference.inDays > 3 && difference.inDays <= 31) {
    return "${difference.inDays} days ago";
  } else {
    return DateFormat.MMMd().add_y().format(dateTime);
  }
}
