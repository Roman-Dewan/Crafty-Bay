class Validators {
  // text validator
  static String? validatorText(String? value, {String? msg}) {
    if (value == null || value.trim().isEmpty) {
      return msg ?? "This field is required";
    }
    return null;
  }

  // Email validator
  static String? validatorEmail(String? value, {String? requiredMsg, String? invalidMsg}) {
    if (value == null || value.trim().isEmpty) {
      return requiredMsg ?? "Email is required";
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return invalidMsg ?? "Invalid email address";
    }

    return null;
  }

  // Password validator
  static String? validatorPassword(String? value,
      {String? requiredMsg,
      String? lengthMsg,
      String? uppercaseMsg,
      String? lowercaseMsg,
      String? numberMsg}) {
    if (value == null || value.trim().isEmpty) {
      return requiredMsg ?? "Password is required";
    }

    if (value.length < 6) {
      return lengthMsg ?? "Password must be at least 6 characters long";
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return uppercaseMsg ?? "Must contain at least one uppercase letter";
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return lowercaseMsg ?? "Must contain at least one lowercase letter";
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return numberMsg ?? "Must contain at least one number";
    }

    return null;
  }

  // Confirm password validator
  static String? validatorConfirmPassword(
    String? value,
    String? password, {
    String? requiredMsg,
    String? mismatchMsg,
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMsg ?? "Confirm password is required";
    }

    if (value.trim() != password?.trim()) {
      return mismatchMsg ?? "Passwords do not match";
    }
    return null;
  }

  // BD Phone validator
  static String? validatorBDPhone(String? value, {String? requiredMsg, String? invalidMsg}) {
    if (value == null || value.trim().isEmpty) {
      return requiredMsg ?? "Phone number is required";
    }

    final phone = value.trim();

    final bdPhoneRegex = RegExp(r'^(?:\+880|880|0)?1[3-9]\d{8}$');

    if (!bdPhoneRegex.hasMatch(phone)) {
      return invalidMsg ?? "Invalid Bangladeshi phone number";
    }

    return null;
  }
}
