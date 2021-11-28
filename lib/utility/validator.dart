String? validateEmail(String value) {
  String _msg = "";
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value.isEmpty) {
    return _msg = "Your username is required";
  } else if (!regex.hasMatch(value)) {
    return _msg = "Please provide a valid emal address";
  }
  return null;
}
