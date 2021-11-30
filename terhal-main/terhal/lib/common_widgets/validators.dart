
abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = 'Email can\'t be empty';
  final String invalidPasswordErrorText = 'Password can\'t be empty';

}
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
static  String validatePassStructure(String value, String title) {
    if (value.isEmpty)
      return title + ' is required*';
    else {
      String pattern =
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$';
      RegExp regExp = new RegExp(pattern);
      bool isMatch = regExp.hasMatch(value);
      if (isMatch)
        return null;
      else
        return 'Please enter a valid password';
    }
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
        return 'Please enter a valid email address';
      }
    }
    return null;
  }
}
