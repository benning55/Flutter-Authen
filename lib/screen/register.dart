import 'package:coolapp/providers/auth_provider.dart';
import 'package:coolapp/utility/validator.dart';
import 'package:coolapp/utility/widget.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String _username = "";
  String _password = "";
  String _confirmPassword = "";

  var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text("Registering ... Please wait")
      ]);

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    void doRegister() {
      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();
        if (_password.endsWith(_confirmPassword)) {
          // create auth provider
          auth.register(_username, _password).then((response) {
            print(response["status"]);
            if (response['status']) {
              //   User user = response['data'];
              //   Provider.of<UserProvider>(context).setUser(user);
              Navigator.pushReplacementNamed(context, "/login");
            } else {
              Flushbar(
                title: "Registration Fail",
                message: response.toString(),
                duration: Duration(seconds: 10),
              ).show(context);
            }
          });
        } else {
          Flushbar(
            title: "Mismatch password",
            message: "Please enter valid confirm password",
            duration: Duration(seconds: 10),
          ).show(context);
        }
      } else {
        Flushbar(
          title: "Invalid Form",
          message: "Please complete the form properly",
          duration: Duration(seconds: 10),
        ).show(context);
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
        ),
        title: Text("Registration"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Text("Email"),
                TextFormField(
                  autofocus: false,
                  validator: (value) => validateEmail(value!),
                  onSaved: (value) => _username = value!,
                  decoration: buildInputDecoration("Enter Email", Icons.email),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text("Password"),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? "Please enter password" : null,
                  onSaved: (value) => _password = value!,
                  decoration:
                      buildInputDecoration("Enter Password", Icons.lock),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text("Confirm Password"),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? "your password is required" : null,
                  onSaved: (value) => _confirmPassword = value!,
                  decoration: buildInputDecoration(
                      "Enter Confirm Password", Icons.lock),
                ),
                SizedBox(
                  height: 20.0,
                ),
                auth.loggedInStatus == Status.Authenticating
                    ? loading
                    : CustomButton("Register", doRegister),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
