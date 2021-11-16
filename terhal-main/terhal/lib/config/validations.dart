class Validation {
  static String validateValue(String value, String title,
      [bool isEmail = false]) {
    if (value.isEmpty)
      return title + ' is required*';
    else if (isEmail && value.isNotEmpty) {
      if (!RegExp(
              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
          .hasMatch(value)) {
        return 'Please enter a valid email address';
      }
    }
    return null;
  }

  bool isEmpty(String value) {
    if (value.isEmpty) return true;

    return false;
  }

  static String validateLoginEmailValue(String value, String title,
      [bool isEmail = false]) {
    if (value.isEmpty)
      return title + ' is required';
    else if (isEmail && value.isNotEmpty) {
      List<String> emailArray = value.split('@');
      if (emailArray.length > 1) {
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email address';
        }
      } else {
        return null;
      }
    }
    return null;
  }
}
