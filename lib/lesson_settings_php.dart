
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr2adminpanel/lessonViewPHP.dart';
import 'package:pr2adminpanel/services/database.dart';

class lessonSettingsPHP extends StatefulWidget {
  @override
  _lessonSettingsPHPState createState() => _lessonSettingsPHPState();
}

final CollectionReference phpCollection = Firestore.instance.collection('phpCollection');

String title, content;
DatabaseServices dbMethods = new DatabaseServices();
class _lessonSettingsPHPState extends State<lessonSettingsPHP> {
  String title, content, code;
  var lessonStreamPHP;
  String lessonTopic;
  DatabaseServices dbMethods = new DatabaseServices();
  List <String> lessonCategory = ['Classes', 'Constructors', 'Inheritance', 'Traits', 'Static Methods','Static Properties', 'Namespaces', 'Abstract Classes','Access Modifiers'];
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
                onPressed: (){
                  Navigator.of(context).pop();
                  switch(lessonTopic.toLowerCase())
                  {

                    case 'classes': {
                      dbMethods.createLessons(phpCollection,'Classes', 'Classes', {
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
                      dbMethods.createLessons(phpCollection,'Access Modifiers', 'Access Modifiers', {
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
                      dbMethods.createLessons(phpCollection,'Inheritance', 'Inheritance', {
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
                    case 'abstract classes': {
                      dbMethods.createLessons(phpCollection,'Abstract Classes', 'Abstract Classes', {
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
                      dbMethods.createLessons(phpCollection,'Constructors', 'Constructors', {
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
                    case 'traits': {
                      dbMethods.createLessons(phpCollection,'Traits', 'Traits', {
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
                    case 'static methods': {
                      dbMethods.createLessons(phpCollection,'Static Methods', 'Static Methods', {
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
                    case 'static properties': {
                      dbMethods.createLessons(phpCollection,'Static Properties', 'Static Properties', {
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
                    case 'namespaces': {
                      dbMethods.createLessons(phpCollection,'Namespaces', 'Namespaces', {
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
        title: Text('PHP Lessons Manage'),
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
                      switch (selectedItem){
                        case 'Classes' : {
                          Navigator.of(context).push(MaterialPageRoute(builder: (
                              context) => lessonViewPHP('Classes')));

                        }break;

                        case 'Abstract Classes' : {
                          Navigator.of(context).push(MaterialPageRoute(builder: (
                              context) => lessonViewPHP('Abstract Classes')));
                        }break;
                        case 'Access Modifiers' : {
                          Navigator.of(context).push(MaterialPageRoute(builder: (
                              context) => lessonViewPHP('Access Modifiers')));
                        }break;
                        case 'Constructors' : {
                          Navigator.of(context).push(MaterialPageRoute(builder: (
                              context) => lessonViewPHP('Constructors')));
                        }break;
                        case 'Static Methods' : {
                          Navigator.of(context).push(MaterialPageRoute(builder: (
                              context) => lessonViewPHP('Static Methods')));
                        }break;
                        case 'Inheritance' : {
                          Navigator.of(context).push(MaterialPageRoute(builder: (
                              context) => lessonViewPHP('Inheritance')));
                        }break;
                        case 'Static Properties' : {
                          Navigator.of(context).push(MaterialPageRoute(builder: (
                              context) => lessonViewPHP('Static Properties')));
                        }break;
                        case 'Namespaces' : {
                          Navigator.of(context).push(MaterialPageRoute(builder: (
                              context) => lessonViewPHP('Namespaces')));
                        }break;
                        case 'Traits' : {
                          Navigator.of(context).push(MaterialPageRoute(builder: (
                              context) => lessonViewPHP('Traits')));
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
