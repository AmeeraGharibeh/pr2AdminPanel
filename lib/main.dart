import 'package:flutter/material.dart';
import 'package:pr2adminpanel/courses_managment.dart';
import 'package:pr2adminpanel/lessonView.dart';
import 'package:pr2adminpanel/lesson_settings_cSharp.dart';
import 'package:pr2adminpanel/lesson_settings_javascript.dart';
import 'package:pr2adminpanel/lesson_settings_php.dart';
import 'package:pr2adminpanel/lessons_settings.dart';
import 'package:pr2adminpanel/login.dart';
import 'package:pr2adminpanel/opp_basics.dart';
import 'package:pr2adminpanel/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: lessonSettings(),
      routes: <String, WidgetBuilder>{
        //  '/homepage': (BuildContext context)=> lessonSettings()
        '/cSharpControl': (BuildContext) => lessonSettingsCSharp(),
        '/phpControl': (BuildContext) => lessonSettingsPHP(),
        '/javascriptControl': (BuildContext) => lessonSettingsJavascript(),
        '/oppBasics': (BuildContext) => oppBasics(),
        '/courses': (BuildContext) => coursesManagement(),



      },
    );
  }
}

class myMain extends StatefulWidget {
  @override
  _myMainState createState() => _myMainState();
}

class _myMainState extends State<myMain> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

