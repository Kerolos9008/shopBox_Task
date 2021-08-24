class Validators {
  static String _emailRegex =
      r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
  static String _passwordRegex =
      r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$";

  static String? validateEmail(String? value) {
    if (value != null) {
      if (RegExp(_emailRegex)
          .hasMatch(value)) {
        return null;
      } else {
        return "Please enter a valid email.";
      }
    } else {
      return "Please enter your email.";
    }
  }

  static String? validatePassword(String? value){
    if (value != null) {
      return null;
    } else {
      return "Please enter your password.";
    }
  }
}
