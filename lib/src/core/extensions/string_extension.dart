extension StringExtension on String{

  String get capitalizedFirst{
    if(isEmpty) return '';
    String string = trim();
    return '${string[0].toUpperCase()}${string.substring(1)}';
  }

  String get minuteAndSecond{
    if(isEmpty) return '';
    String string = trim();
    return string.substring(0, 5);
  }

  bool get isValidEmail {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool get isValidPhone {
    return RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
        .hasMatch(this);
  }

  String get getDuration {
    int duration = DateTime.now().difference(DateTime.parse(this)).inMinutes;
    if(duration < 2){
      return '$duration minute';
    } else if(duration < 60){
      return '$duration minutes';
    } else if(duration > 60 && duration < 120){
      duration = DateTime.now().difference(DateTime.parse(this)).inHours;
      return '$duration hour';
    } else if(duration < 120){
      duration = DateTime.now().difference(DateTime.parse(this)).inHours;
      return '$duration hours';
    } else if(duration < 1440){
      duration = DateTime.now().difference(DateTime.parse(this)).inDays;
      return '$duration day';
    } else {
      duration = DateTime.now().difference(DateTime.parse(this)).inDays;
      return '$duration days';
    }
  }
}