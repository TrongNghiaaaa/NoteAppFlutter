class CommonRegex {
  static RegExp phoneRegExp = RegExp(r'(((\+|)84)|0)(3|5|7|8|9)+([0-9]{8})\b');

  static RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static RegExp passRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
}
