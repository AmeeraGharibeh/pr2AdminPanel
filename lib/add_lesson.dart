/*
import 'package:flutter/material.dart';

class addLesson extends StatefulWidget {
  @override
  _addLessonState createState() => _addLessonState();
}
class _addLessonState extends State<addLesson> {
  String lessonTopic, title, content, code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Lesson'),
      ),
      body:Container(
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
                        'when': DateTime.now(),

                      }).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'access modifiers and properties': {
                      dbMethods.createLessons(cSharpCollection,'Access Modifiers and Properties', 'Access Modifiers and Properties', {
                        'Number' : this.lessonTopic,
                        'title' : this.title,
                        'content': this.content,
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
          ),
        ),
      ) ,
    );

  }
}
*/
