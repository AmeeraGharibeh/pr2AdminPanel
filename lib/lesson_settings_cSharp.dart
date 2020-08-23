
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr2adminpanel/lessonView.dart';
import 'package:pr2adminpanel/services/database.dart';

// ignore: camel_case_types
class lessonSettingsCSharp extends StatefulWidget {
  @override
  _lessonSettingsCSharpState createState() => _lessonSettingsCSharpState();
}
class _lessonSettingsCSharpState extends State<lessonSettingsCSharp> {
  final CollectionReference cSharpCollection = Firestore.instance.collection('cSharpCollection');
  String title, content,lessonTopic,code;
  var lessonStreamcSharp;
  DatabaseServices dbMethods = new DatabaseServices();
  List <String> lessonCategory = ['Classes', 'Constructors', 'Inheritance', 'Polymorphism', 'Files','Exceptions', 'Enums', 'Abstraction and Interface','Access Modifiers and Properties'];
  String selectedItem;

Future <void> addLessons (BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,

        builder: (BuildContext context) {
          return AlertDialog(
            title: Text ('Add a New Lesson'),
            content: Container(
              width: 700,
              height: 600,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the Topic',
                      ),
                      onChanged: (value){
                        this.lessonTopic = value;
                      },
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the Lesson Title',
                      ),
                      onChanged: (value){
                        this.title = value;
                      },
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the Lesson Content',
                      ),
                      maxLines: 10,
                      onChanged: (value){
                        this.content = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Code (*optional)',
                      ),
                      maxLines: 10,
                      onChanged: (value){
                        this.code = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Add'),
                onPressed: (){
                  Navigator.of(context).pop();

                 switch(lessonTopic.toLowerCase())
                 {
                   case 'classes': {
                     dbMethods.createLessons(cSharpCollection,'Classes', 'Classes', {
                       'Number' : this.lessonTopic,
                       'title' : this.title,
                       'content': this.content,
                       'code': this.code,
                       'isDone': 0,
                       'when': DateTime.now(),

                     }).then((value) {
                       resultDialogAdd(context);
                     } );
                   }
                   break;
                   case 'polymorphism': {
                     dbMethods.createLessons(cSharpCollection,'Polymorphism', 'Polymorphism', {
                       'Number' : this.lessonTopic,
                       'title' : this.title,
                       'content': this.content,
                       'code': this.code,
                       'isDone': 0,
                       'when': DateTime.now(),

                     }).then((value) {
                       resultDialogAdd(context);
                     } );
                   }
                   break;
                   case 'constructors': {
                     dbMethods.createLessons(cSharpCollection,'Constructors', 'Constructors', {
                       'Number' : this.lessonTopic,
                       'title' : this.title,
                       'content': this.content,
                       'code': this.code,
                       'isDone': 0,
                       'when': DateTime.now(),

                     }).then((value) {
                       resultDialogAdd(context);
                     } );
                 }
                 break;
                   case 'enums': {
                     dbMethods.createLessons(cSharpCollection,'Enums', 'Enums', {
                       'Number' : this.lessonTopic,
                       'title' : this.title,
                       'content': this.content,
                       'code': this.code,
                       'isDone': 0,
                       'when': DateTime.now(),

                     }).then((value) {
                       resultDialogAdd(context);
                     } );
                 }
                 break;
                   case 'inheritance': {
                     dbMethods.createLessons(cSharpCollection,'Inheritance', 'Inheritance', {
                       'Number' : this.lessonTopic,
                       'title' : this.title,
                       'content': this.content,
                       'code': this.code,
                       'isDone': 0,
                       'when': DateTime.now(),

                     }).then((value) {
                       resultDialogAdd(context);
                     } );
                 }
                 break;
                   case 'files': {
                     dbMethods.createLessons(cSharpCollection,'Files', 'Files', {
                       'Number' : this.lessonTopic,
                       'title' : this.title,
                       'content': this.content,
                       'code': this.code,
                       'isDone': 0,
                       'when': DateTime.now(),

                     }).then((value) {
                       resultDialogAdd(context);
                     } );
                   }
                   break;
                   case 'exceptions': {
                     dbMethods.createLessons(cSharpCollection,'Exceptions', 'Exceptions', {
                       'Number' : this.lessonTopic,
                       'title' : this.title,
                       'content': this.content,
                       'code': this.code,
                       'isDone': 0,
                       'when': DateTime.now(),

                     }).then((value) {
                       resultDialogAdd(context);
                     } );
                   }
                   break;
                   case 'abstraction and interface': {
                     dbMethods.createLessons(cSharpCollection,'Abstraction and Interface', 'Abstraction and Interface', {
                       'Number' : this.lessonTopic,
                       'title' : this.title,
                       'content': this.content,
                       'code': this.code,
                       'isDone': 0,
                       'when': DateTime.now(),

                     }).then((value) {
                       resultDialogAdd(context);
                     } );
                   }
                   break;
                   case 'access modifiers': {
                     dbMethods.createLessons(cSharpCollection,'Access Modifiers and Properties', 'Access Modifiers and Properties', {
                       'Number' : this.lessonTopic,
                       'title' : this.title,
                       'content': this.content,
                       'code': this.code,
                       'isDone': 0,
                       'when': DateTime.now(),

                     }).then((value) {
                       resultDialogAdd(context);
                     } );
                   }
                   break;
                 }
                },
              )
            ],
          );
        }
    );
  }

  Future <bool> resultDialogAdd (BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add a New Lesson'),
            content: Text('Lesson Added !'),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }

    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C# Lessons Manage'),
        actions: <Widget>[
          FlatButton.icon (icon: Icon (Icons.add, ),
            label: Text('Add'),
            onPressed: (){
              addLessons(context);
            },
          ),

        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: <Widget>[
                  Text('Choose the lesson type to view and manage:', style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                  ),),
              SizedBox(height: 20,),
              DropdownButton(
              hint: Text('Choose a lesson'),
              value: selectedItem,
              onChanged: (newValue) {
                setState(() {
                  selectedItem = newValue;
                });
              },
              items: lessonCategory.map((e){
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
        ),
                  SizedBox(height: 15,),
                  RaisedButton(
                  onPressed: (){
                    switch (selectedItem){
                      case 'Classes' : {
                        Navigator.of(context).push(MaterialPageRoute(builder: (
                            context) => lessonView('Classes')));

                      }break;

                      case 'Abstraction and Interface' : {
                        Navigator.of(context).push(MaterialPageRoute(builder: (
                            context) => lessonView('Abstraction and Interface')));
                      }break;
                      case 'Access Modifiers and Properties' : {
                        Navigator.of(context).push(MaterialPageRoute(builder: (
                            context) => lessonView('Access Modifiers and Properties')));
                      }break;
                      case 'Constructors' : {
                        Navigator.of(context).push(MaterialPageRoute(builder: (
                            context) => lessonView('Constructors')));
                      }break;
                      case 'Polymorphism' : {
                        Navigator.of(context).push(MaterialPageRoute(builder: (
                            context) => lessonView('Polymorphism')));
                      }break;
                      case 'Inheritance' : {
                        Navigator.of(context).push(MaterialPageRoute(builder: (
                            context) => lessonView('Inheritance')));
                      }break;
                      case 'Enums' : {
                        Navigator.of(context).push(MaterialPageRoute(builder: (
                            context) => lessonView('Enums')));
                      }break;
                      case 'Files' : {
                        Navigator.of(context).push(MaterialPageRoute(builder: (
                            context) => lessonView('Files')));
                      }break;
                      case 'Exceptions' : {
                        Navigator.of(context).push(MaterialPageRoute(builder: (
                            context) => lessonView('Exceptions')));
                      }break;
                    }
                  },
                  child: Text('go'),
                )
                //  myLessonsView(),
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
