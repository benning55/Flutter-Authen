import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0)),
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}

MaterialButton longButtons(String title, Function fun,
    {Color color: Colors.blue, Color textColor: Colors.white}) {
  return MaterialButton(
    onPressed: fun(),
    textColor: textColor,
    color: Colors.blue,
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    height: 45,
    minWidth: 600,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}

MaterialButton CustomButton(String text, Function onFunc) {
  return MaterialButton(
    onPressed: () => {onFunc()},
    height: 45.0,
    minWidth: 600,
    color: Colors.blue,
    textColor: Colors.white,
    child: SizedBox(
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}
