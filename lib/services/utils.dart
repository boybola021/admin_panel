sealed class Utils {

  static bool regexEmail(String email) =>  RegExp(r"[a-z A-Z 0-9]{3,}@gmail.com$").hasMatch(email.trim());
  static bool regexPassword(String password) => RegExp(r"[a-z A-Z 0-9]{6,}").hasMatch(password.trim());

  static bool regexProductName(String name) => RegExp(r"[a-z A-Z]{4,}").hasMatch(name.trim());
  static bool regexProductDesc(String name) => RegExp(r"[a-z A-Z]{6,}").hasMatch(name.trim());
  static bool regexProductPrice(String name) => RegExp(r"\d+").hasMatch(name.trim());

}
