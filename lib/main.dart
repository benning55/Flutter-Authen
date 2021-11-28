import 'package:coolapp/providers/auth_provider.dart';
import 'package:coolapp/providers/user_provider.dart';
import 'package:coolapp/screen/dashboard.dart';
import 'package:coolapp/screen/login.dart';
import 'package:coolapp/screen/register.dart';
import 'package:coolapp/utility/shared_peference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<User> getUserData() => UserPreferences().getUser();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp(
        title: "Login Registration",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: FutureBuilder(
            future: UserPreferences().getUser(),
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else if (snapshot.data!.token == null)
                    return Login();
                  else
                    Provider.of<UserProvider>(context).setUser(snapshot.data);
                  return DashBoard();
              }
            }),
        routes: {
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          '/dashboard': (context) => DashBoard()
        },
      ),
      //   child: MaterialApp(
      //     title: "Login Registration",
      //     theme: ThemeData(primaryColor: Colors.blue),
      //     home: Login(),
      //     routes: {
      //       '/login': (context) => Login(),
      //       '/register': (context) => Register(),
      //       '/dashboard': (context) => DashBoard()
      //     },
      //   ),
    );
  }
}
