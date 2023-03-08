/// Validate user input and data
class Validator {
  /// Validates Full Name and needs to be more than 4 characters
  static String? name(String? value) {
    const pattern = r'(^[a-zA-Z ]*$)';
    final regExp = RegExp(pattern);
    if (regExp.hasMatch(value!) && value.trim().length > 4) {
      return null;
    } else if (value.trim().length < 4) {
      return 'Full name must be more than 5 characters';
    } else {
      return 'Name must be alphabets only';
    }
  }

  /// Pattern checks for valid phone Numbers
  static String? phoneNumber(String? value) {
    if (value!.isEmpty) {
      return '😉 Come on, don\'t be shy, enter your number';
    }

    /// TODO(WINFRED) Add regEx
    else if (value.length < 10) {
      if (10 - value.length == 1) {
        return '😉 You\'re missing ${10 - value.length} digit';
      }

      return '👏 Come on, ${10 - value.length} digits more';
    }

    /// When [value] is greater than 10
    else if (value.length > 10) {
      return '📢 Valid phone numbers are 10 digits right ?';
    }
    return null;
  }

  /// Displays an enabled button or a disabled one based on form validity
  static bool? formValid(String? value) {
    /// Show enabled button
    if (value!.length == 10) {
      return true;
    } else if (value.length < 10 || value.length > 10) {
      /// Show disabled button
      return false;
    }
    return null;
  }

  /// Validate Email address
  static String? email(String? value){
    final RegExp pattern = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      caseSensitive: false,
      unicode: true,
    );
    if(value!.isEmpty){
      return null;
    }
    if(pattern.hasMatch(value)){
      return null;
    }
    if(value.endsWith('@st.knust.edu.gh')){
      return null;
    }
    else{
      return 'Invalid email address';
    }
  }
}
