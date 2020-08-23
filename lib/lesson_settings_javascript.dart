
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr2adminpanel/lessonViewJavascript.dart';
import 'package:pr2adminpanel/services/database.dart';

class lessonSettingsJavascript extends StatefulWidget {
  @override
  _lessonSettingsJavascriptState createState() => _lessonSettingsJavascriptState();
}
final CollectionReference javascriptCollection = Firestore.instance.collection('javascriptCollection');
String title, content;
DatabaseServices dbMethods = new DatabaseServices();
class _lessonSettingsJavascriptState extends State<lessonSettingsJavascript> {
  String title, content, code;
  var lessonStreamJavascript;
  String lessonTopic;
  DatabaseServices dbMethods = new DatabaseServices();
  List <String> lessonCategory = ['Classes', 'Constructors', 'Prototypes', 'Display', 'Methods','Accessors', 'Properties'];
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
                      maxLines: 6,
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
                onPressed: () {
                  Navigator.of(context).pop();
                  switch(lessonTopic.toLowerCase())
                  {

                    case 'classes': {
                      dbMethods.createLessons(javascriptCollection,'Classes', 'Classes', {
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
                    case 'properties': {
                      dbMethods.createLessons(javascriptCollection,'Properties', 'Properties', {
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
                    case 'methods': {
                      dbMethods.createLessons(javascriptCollection,'Methods', 'Methods', {
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
                    case 'accessors': {
                      dbMethods.createLessons(javascriptCollection,'Accessors', 'Accessors', {
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
                      dbMethods.createLessons(javascriptCollection,'Constructors', 'Constructors', {
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
                    case 'prototypes': {
                      dbMethods.createLessons(javascriptCollection,'Prototypes', 'Prototypes', {
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
                    case 'display': {
                      dbMethods.createLessons(javascriptCollection,'Display', 'Display', {
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
                }
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
        title: Text('JavaScript Lessons Manage'),
        actions: <Widget>[
          FlatButton.icon (icon: Icon (Icons.add, ),
            label: Text('Add'),
            onPressed: (){
              addLessons(context);
            },
          ),

        ],
      ),
      body:  Container(
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
                      switch (selectedItem) {
                        case 'Classes' :
                          {Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => lessonViewJavascript('Classes')));
                          }
                          break;

                        case 'Prototypes' :
                          { Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => lessonViewJavascript('Prototypes')));
                          }
                          break;
                        case 'Accessors' :
                          { Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => lessonViewJavascript('Accessors')));
                          }
                          break;
                        case 'Constructors' :
                          {Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => lessonViewJavascript('Constructors')));
                          }
                          break;
                        case 'Properties' :
                          {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => lessonViewJavascript('Properties')));
                          }
                          break;
                        case 'Methods' :
                          {Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => lessonViewJavascript('Methods')));
                          }
                          break;
                        case 'Display' :
                          { Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => lessonViewJavascript('Display')));
                          }
                          break;
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
