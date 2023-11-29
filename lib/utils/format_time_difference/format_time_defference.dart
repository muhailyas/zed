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

String formatDateTime(String inputDateTimeString) {
  // Parse the input string into a DateTime object
  DateTime inputDateTime = DateTime.parse(inputDateTimeString);

  // Get the current date and time
  DateTime now = DateTime.now();

  // Calculating date the difference in hours between the input and current date and time
  int hoursDifference = now.difference(inputDateTime).inHours;

  // Format the input date based on the conditions

  // if the difference is less than 1 minute ,show the difference as seconds
  int secondDifference = now.difference(inputDateTime).inSeconds;
  if (secondDifference < 60) {
    return 'just now';
  } else if (hoursDifference < 1) {
    // If the difference is less than 1 hour, show the time difference in minutes
    int minutesDifference = now.difference(inputDateTime).inMinutes;
    return '$minutesDifference minutes ago';
  } else if (hoursDifference < 24) {
    // If the difference is less than 24 hours, show "Today" or "Yesterday" with the time
    String timeFormat = DateFormat.jm().format(inputDateTime);
    return (hoursDifference < 2)
        ? 'Today $timeFormat'
        : 'Yesterday $timeFormat';
  } else {
    // If the difference is more than 24 hours, show the full date and time
    return DateFormat('MMMM d, hh:mm a').format(inputDateTime);
  }
}

String formatGroupTime(DateTime timestamp, DateTime today, DateTime yesterday) {
  if (isSameDay(timestamp, today)) {
    return 'Today';
  } else if (isSameDay(timestamp, yesterday)) {
    return 'Yesterday';
  } else {
    return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
