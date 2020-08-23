import 'package:flutter/material.dart';
import 'package:pr2adminpanel/home.dart';
import 'package:pr2adminpanel/login.dart';
import 'package:pr2adminpanel/services/auth.dart';

class wrapper extends StatefulWidget {
  @override
  _wrapperState createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {
  @override
  Widget build(BuildContext context) {
    AuthMethods auth = AuthMethods();
    return StreamBuilder (
      stream: auth.userStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return myHome();
        }else
          {
            return Login();
          }
      }
    );
  }
}
