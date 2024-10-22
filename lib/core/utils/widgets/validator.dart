class Validator {
  static bool hasMinLength(String? value, {int minLength = 1}) {
    if (value == null) return false;
    return value.trim().length >= minLength;
  }

  static bool isEmail(String? value) {
    if (value == null) return false;
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value);
  }

  static bool isPassword(String? value) {
    if (value == null) return false;
    return value.trim().length >= 8;
  }

  static bool isPhone(String? value) {
    if (value == null) return false;
    return value.trim().length >= 9;
  }

  static bool isotp(String? value) {
    if (value == null) return false;
    return value.trim().length >= 4;
  }

  static bool isEGPhoneNumber(String? value) {
    if (value == null) return false;
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(value);
  }

  static bool isKSAPhoneNumber(String? value) {
    if (value == null) return false;
    return RegExp(r'^(05)[0-9]{8}$').hasMatch(value);
  }

  static bool isPasswordConfirmed(String? password, String? confirmPassword) {
    if (password == null || confirmPassword == null) return false;
    return password == confirmPassword;
  }

  static bool isOTPValid(String? value, {int length = 4}) {
    if (value == null) return false;
    return RegExp(r'^\d{' + length.toString() + r'}$').hasMatch(value);
  }

  static bool isEmpty(String? value) {
    if (value == null) return true;
    return value.trim().isEmpty;
  }

  static String? validateNotEmpty(String? value) {
    if (isEmpty(value)) {
      return 'This field cannot be empty';
    }
    return null;
  }
}
