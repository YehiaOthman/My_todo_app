bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

}

// // String defaultValidator(String value) {
// //   if (value == null || value.trim().isEmpty) {
// //     return 'invalid input';
// //   }
// }
