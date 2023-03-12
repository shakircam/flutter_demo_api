
mixin InputValidationMixin {
  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Required password";
    } else if (!RegExp(r'^(?=.*[a-z]).+$').hasMatch(password))  {
      return "Password should be contains at least one small letter";
    } else if (!RegExp(r'^(?=.*[A-Z]).+$').hasMatch(password))  {
      return "Password should be contains at least one capital letter";
    } else if (!RegExp(r'^(?=.*\d).+$').hasMatch(password))  {
      return "Password should be contains at least one number letter";
    } else if (!RegExp(r'^(?=.*[!@#\$&*~]).+$').hasMatch(password))  {
      return "Password should be contains at least one special character letter";
    } else if (password.length < 6) {
      return "Password should be at least 6 characters";
    } else if (password.length > 15) {
      return "Password should not be greater tan 15 characters";
    } else {
      return null;
    }
  }


  String? isEmailValid(String email) {

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9][a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if(!regex.hasMatch(email)){
      return "Enter a valid email address";
    }else{
    return null;
    }
  }
}