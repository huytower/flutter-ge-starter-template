class RegexHelper {
  static String phone() {
    return r'(^(?:[+0]9)?[0-9]{10,12}$)';
  }

  static String email() {
    return r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  }

  static String phoneAff() {
    return r'(^(?:[+0]9)?[0-9]{10,12}$)';
  }

  static String emailAff() {
    return r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  }

  static String regexName() {
    return r'[A-Za-z0-9 ]{1,}';
  }

  static String regexEmail() {
    return r'[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,5}';
  }

  static String regexPhone() {
    return r'[0-9]{1,15}';
  }
}
