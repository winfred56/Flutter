/// Validate user input and data
class Validator {
  /// Validates Full Name and needs to be more than 4 characters
  static String? name(String? value) {
    const pattern = r'(^[a-zA-Z -]*$)';
    final regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return '📢 You must enter your full name to continue';
    }
    if (regExp.hasMatch(value) && value.trim().length > 4) {
      return null;
    } else if (value.trim().length < 4) {
      return '📢 Full name must be more than 5 characters';
    } else {
      return '📢 Name can contain Alphabets and hyphens only';
    }
  }

  /// Validate Email address
  static String? email(String? value) {
    final RegExp pattern = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      caseSensitive: false,
      unicode: true,
    );
    if (value!.isEmpty) {
      return '📢 Email cannot be empty';
    }
    if (pattern.hasMatch(value)) {
      return null;
    } else {
      return '📢 Invalid email address';
    }
  }

  /// Validates Username
  static String? username(String? value) {
    const pattern = r'(^[a-zA-Z0-9_]*$)';
    final regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return '📢 username cannot be empty';
    }
    if (regExp.hasMatch(value) && value.trim().length > 4) {
      return null;
    } else if (value.trim().length < 4) {
      return '📢 username must be more than 5 characters';
    } else {
      return '📢 Alphabets and Underscores only';
    }
  }

  /// Validates Password
  static String? password(String? value) {
    if (value!.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else {
      return null;
    }
  }

  //
  static String? required(String? value) {
    if (value!.isEmpty) {
      return 'Please provide a value for the field';
    }
    return null;
  }

  static String? dateOfBirth(String? value) {
    if (value!.isEmpty) {
      return '📢 Please provide your birth date';
    }
    return null;
  }

  // Validate amount
  static String? amount(String? value) {
    if (value != null) {
      final RegExp pattern = RegExp(r'^[1-9][\d]*');
      if (value.isEmpty) {
        return 'Please provide a value for the field';
      } else if (int.parse(value) <= 0 || !pattern.hasMatch(value)) {
        return 'Please enter a valid amount';
      }
    }
    return null;
  }

  // Validate mobile number
  static String? mobileNumber(String? value) {
    if (value != null) {
      final RegExp pattern = RegExp(r'^[0][\d]{9}$');
      if (value.isEmpty) {
        return 'Please provide a value for the field';
      } else if (!pattern.hasMatch(value)) {
        return 'Please enter a valid mobile number';
      }
    }
    return null;
  }

  /// Pattern checks for valid phone Numbers
  static String? phoneNumber(String? value) {
    const pattern = r'^[0-9]{9}$';
    final regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return '📢 Please enter your Phone number';
    }
    if (value.length != 9) {
      return '📢 Phone should be 9 digits';
    }
    if (!regExp.hasMatch(value)) {
      return '📢 Phone should contain numbers only';
    }
    return null;
  }
}
