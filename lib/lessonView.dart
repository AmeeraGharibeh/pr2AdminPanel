import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pr2adminpanel/services/database.dart';
import 'package:file_picker_cross/file_picker_cross.dart';


class lessonView extends StatefulWidget {
  String selectedItem;
  lessonView(this.selectedItem);
  @override
  _lessonViewState createState() => _lessonViewState(this.selectedItem);
}

class _lessonViewState extends State<lessonView> {
  String selectedItem;
  _lessonViewState(this.selectedItem);

  PageController pageController = new PageController();
  final CollectionReference cSharpCollection = Firestore.instance.collection('cSharpCollection');

  String title, content,lessonTopic,code;
  String Example1, Example2, Example1Code, Example2Code;
  int currentPage=0;
  var lessonStreamcSharp;
  DatabaseServices dbMethods = new DatabaseServices();
  var lessonStream;
  File quizFile;

  @override
  void initState(){
    switch (selectedItem){
      case 'Classes' : {
        dbMethods.getLessons(cSharpCollection, 'Classes', 'Classes').then((value) {
          setState(() {
            lessonStreamcSharp = value;

          });
        });

      }break;
      case 'Abstraction and Interface' : {
        dbMethods.getLessons(cSharpCollection, 'Abstraction and Interface', 'Abstraction and Interface').then((value) {
          setState(() {
            lessonStreamcSharp = value;
          });
        });
      }break;
      case 'Access Modifiers and Properties' : {
        dbMethods.getLessons(cSharpCollection, 'Access Modifiers and Properties', 'Access Modifiers and Properties').then((value) {
          setState(() {
            lessonStreamcSharp = value;
          });
        });
      }break;
      case 'Constructors' : {
        dbMethods.getLessons(cSharpCollection, 'Constructors', 'Constructors').then((value) {
          setState(() {
            lessonStreamcSharp = value;
          });
        });
      }break;
      case 'Polymorphism' : {
        dbMethods.getLessons(cSharpCollection, 'Polymorphism', 'Polymorphism').then((value) {
          setState(() {
            lessonStreamcSharp = value;
          });
        });
      }break;
      case 'Inheritance' : {
        dbMethods.getLessons(cSharpCollection, 'Inheritance', 'Inheritance').then((value) {
          setState(() {
            lessonStreamcSharp = value;
          });
        });
      }break;
      case 'Enums' : {
        dbMethods.getLessons(cSharpCollection, 'Enums', 'Enums').then((value) {
          setState(() {
            lessonStreamcSharp = value;
          });
        });
      }break;
      case 'Files' : {
        dbMethods.getLessons(cSharpCollection, 'Files', 'Files').then((value) {
          setState(() {
            lessonStreamcSharp = value;
          });
        });
      }break;
      case 'Exceptions' : {
        dbMethods.getLessons(cSharpCollection, 'Exceptions', 'Exceptions').then((value) {
          setState(() {
            lessonStreamcSharp = value;
          });
        });
      }break;
    }
  }
  Future updateDialog (BuildContext context , selectedItem) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(

            title: Text('Update Lesson'),
            content: Container(
              width: 400,
              height: 500,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                       // hintText: this.title,

                      ),
                      onChanged: (value) {
                        this.title= value;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: this.content,

                      ),
                      maxLines: 10,

                      onChanged: (value) {
                        this.content= value;
                      },
                    ),

                  ],
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Update'),
                onPressed: () {
                  Navigator.of(context).pop();
                  dbMethods.updateLessons(cSharpCollection,selectedItem, selectedItem, selectedItem, {
                    'title' : this.title,
                    'content' : this.content,
                  }).then((value) {resultDialogUpdate(context);}).catchError((e) {
                    print(e);
                  });
                },
              )
            ],
          );
        }
    );
  }
  Future <bool> resultDialogUpdate (BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update Lesson'),
            content: Text('Lesson Updated !'),
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
  Future <void> addExample (BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,

        builder: (BuildContext context) {
          return AlertDialog(
            title: Text ('Add Examples'),
            content: Container(
              width: 700,
              height: 600,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Example explanation',
                      ),
                      maxLines: 10,
                      onChanged: (value){
                        this.Example1 = value;
                      },
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Example Code',
                      ),
                      maxLines: 10,
                      onChanged: (value){
                        this.Example1Code = value;
                      },
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Another Example explanation (*optional)'
                      ),
                      maxLines: 10,
                      onChanged: (value){
                        this.Example2 = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Another Example Code (*optional)',
                      ),
                      maxLines: 10,
                      onChanged: (value){
                        this.Example2Code = value;
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

                  switch(selectedItem)
                  {
                    case 'Classes': {
                      dbMethods.addExample(cSharpCollection, 'Examples', 'Classes', Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Polymorphism': {
                      dbMethods.addExample(cSharpCollection,'Examples', 'Polymorphism',  Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Constructors': {
                      dbMethods.addExample(cSharpCollection,'Examples', 'Constructors',  Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Enums': {
                      dbMethods.addExample(cSharpCollection,'Examples', 'Enums',  Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Inheritance': {
                      dbMethods.addExample(cSharpCollection,'Examples', 'Inheritance', Example1, Example2, Example1Code, Example2Code);
                    }
                    break;
                    case 'Files': {
                      dbMethods.addExample(cSharpCollection,'Examples', 'Files',  Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Exceptions': {
                      dbMethods.addExample(cSharpCollection,'Examples', 'Exceptions',  Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Abstraction and Interface': {
                      dbMethods.addExample(cSharpCollection,'Examples', 'Abstraction and Interface',  Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Access Modifiers and Properties': {
                      dbMethods.addExample(cSharpCollection,'Examples', 'Access Modifiers and Properties',  Example1, Example2, Example1Code, Example2Code );
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

  Future getQuizFile () async {
    var result = await FilePickerCross.pick();
    setState (()=> quizFile= File(result.path));
    return uploadFieDialog(context);
  }
  Future uploadFieDialog (BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Upload File'),
            content: Container (
              width: 180,
              height: 180,
              child: Column (
                children: <Widget>[
                  Image.file(quizFile, width: 150, height: 150,),
                  SizedBox(height: 15,),

                ],
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Upload'),
                    onPressed: () async{
                      Navigator.of(context).pop();
                      final StorageReference myFirebaseStorage = FirebaseStorage.instance.ref().child('/${DateTime.now().toString()}.json');
                      final StorageUploadTask task = myFirebaseStorage.putFile(quizFile);
                      var downloadUrl = await (await task.onComplete).ref.getDownloadURL();
                      String fileUrl = downloadUrl.toString();

                      switch (selectedItem){
                        case 'Classes' : {
                        dbMethods.createLessons(cSharpCollection,  'Quiz', 'Classes', {
                          'QuizFile': fileUrl,
                          'when': DateTime.now()
                        }).then((value) {
                          resultDialogAdd(context);
                        } );

                        }break;
                        case 'Abstraction and Interface' : {
                          dbMethods.createLessons(cSharpCollection, 'Quiz', 'Abstraction and Interface', {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Access Modifiers and Properties' : {
                          dbMethods.createLessons(cSharpCollection, 'Quiz', 'Access Modifiers and Properties',  {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Constructors' : {
                          dbMethods.createLessons(cSharpCollection,  'Quiz', 'Constructors', {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Polymorphism' : {
                          dbMethods.createLessons(cSharpCollection,  'Quiz', 'Polymorphism', {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Inheritance' : {
                          dbMethods.createLessons(cSharpCollection, 'Quiz', 'Inheritance',  {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Enums' : {
                          dbMethods.createLessons(cSharpCollection,  'Quiz', 'Enums', {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Files' : {
                          dbMethods.createLessons(cSharpCollection, 'Quiz', 'Files',  {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Exceptions' : {
                          dbMethods.createLessons(cSharpCollection, 'Quiz', 'Exceptions',  {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                      }
                    },
                  ),
                  SizedBox(width: 20,),
                  RaisedButton(
                    child: Text('Cancel'),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        }
    );
  }

  Widget lessonContainer (){
    if (lessonStreamcSharp != null){
      return StreamBuilder(
        stream: lessonStreamcSharp,
        builder: (context, snapshot){
          if (snapshot.hasData){
           return PageView.builder(
              controller: pageController,
                itemCount: snapshot.data.documents.length,
                onPageChanged: (val){
                setState(() {
                  currentPage = val;
                });
                },
                itemBuilder: (context, i) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 700,
                        width: 500,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(0.2),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(snapshot.data.documents[i].data['title'], style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 20,),
                            Text(snapshot.data.documents[i].data['content'], style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),),
                            SizedBox(height: 60,),
                            Row (
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FlatButton(

                                  child: Text('Update'),
                                  onPressed: (){
                                    updateDialog(context, snapshot.data.documents[i].documentID);
                                  },
                                  color: Colors.grey[300],
                                ),
                                // SizedBox(width: 30,),
                                FlatButton(
                                  child: Text('Delete'),
                                  onPressed: (){
                                    dbMethods.deleteLesson(cSharpCollection, snapshot.data.documents[i].documentID);
                                  },
                                  color: Colors.grey[300],
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FlatButton(
                                  child: Text('Add Example'),
                                  onPressed: (){
                                    addExample(context);
                                  },
                                  color: Colors.grey[300],
                                ),
                                FlatButton(
                                  child: Text('Add Quiz'),
                                  onPressed: (){
                                    getQuizFile();
                                  },
                                  color: Colors.grey[300],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ),
                  );
                }
            );
          }else {
            return Text ('Loading...');
          }
        },
      );
    }else {
      return Text ('Loading...');
    }
  }
  Widget lessonPageView(){

    return PageView(
      controller: pageController,
      children: <Widget>[
        lessonContainer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson Content'),
        centerTitle: true,

      ),
      body: lessonPageView(),
    );
  }
}
