

sealed class KTStrings{
  static const String notLogin = "No login or password available, try again";
  static const String emailMessage = "You entered the email incorrectly, try again";
  static const String somethingError = "Something error, try again later";
  static const String checkYourInternet = "Something error, Please check your internet connecting!";
  static const String checkYourField = "There may be an empty field. Please check";
  static const String successfullyUpload = "Your product has been successfully uploaded";
  static const String descriptionError = "The length of the product description should not be less than 6 characters";
  static const String nameError = "The length of the product name should not be less than 4 characters";
  static const String next = "Next";

  static const String name = "Name";
  static const String desc = "Description";
  static const String category = "Category";
  static const String price = "Price";
  static const String forgotPassword = "Forgot password ?";
  static const String signIn = "Sign In";

  static const String home = "Home";
  static const String download = "Download";
  static const String uploadFile = "Upload";


}

enum CategoryEnum{
  food("Foods"),
  salad("Salad"),
  dessert("Dessert"),
  fruits("Fruits"),
  drink("Drink");
  const CategoryEnum(this.category);
  final String category;
}