import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pr2adminpanel/services/database.dart';

class lessonViewPHP extends StatefulWidget {
  String selectedItem;
  lessonViewPHP(this.selectedItem);
  @override
  _lessonViewPHPState createState() => _lessonViewPHPState(this.selectedItem);
}

class _lessonViewPHPState extends State<lessonViewPHP> {
  String selectedItem;
  _lessonViewPHPState(this.selectedItem);

  PageController pageController = new PageController();
  final CollectionReference phpCollection = Firestore.instance.collection('phpCollection');

  String title, content,lessonTopic,code;
  String Example1, Example2, Example1Code, Example2Code;
  int currentPage=0;
  var lessonStream;
  File quizFile;
  DatabaseServices dbMethods = new DatabaseServices();

  @override
  void initState(){
    switch (selectedItem){
      case 'Classes' : {
        dbMethods.getLessons(phpCollection, 'Classes', 'Classes').then((value) {
          setState(() {
            lessonStream = value;

          });
        });

      }break;
      case 'Traits' : {
        dbMethods.getLessons(phpCollection, 'Traits', 'Traits').then((value) {
          setState(() {
            lessonStream = value;
          });
        });
      }break;
      case 'Static Methods' : {
        dbMethods.getLessons(phpCollection, 'Static Methods', 'Static Methods').then((value) {
          setState(() {
            lessonStream = value;
          });
        });
      }break;
      case 'Constructors' : {
        dbMethods.getLessons(phpCollection, 'Constructors', 'Constructors').then((value) {
          setState(() {
            lessonStream = value;
          });
        });
      }break;
      case 'Static Properties' : {
        dbMethods.getLessons(phpCollection, 'Static Properties', 'Static Properties').then((value) {
          setState(() {
            lessonStream = value;
          });
        });
      }break;
      case 'Inheritance' : {
        dbMethods.getLessons(phpCollection, 'Inheritance', 'Inheritance').then((value) {
          setState(() {
            lessonStream = value;
          });
        });
      }break;
      case 'Namespaces' : {
        dbMethods.getLessons(phpCollection, 'Namespaces', 'Namespaces').then((value) {
          setState(() {
            lessonStream = value;
          });
        });
      }break;
      case 'Access Modifiers' : {
        dbMethods.getLessons(phpCollection, 'Access Modifiers', 'Access Modifiers').then((value) {
          setState(() {
            lessonStream = value;
          });
        });
      }break;
      case 'Abstract Classes' : {
        dbMethods.getLessons(phpCollection, 'Abstract Classes', 'Abstract Classes').then((value) {
          setState(() {
            lessonStream = value;
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
              width: 150,
              height: 120,
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
                    onChanged: (value) {
                      this.content= value;
                    },
                  ),

                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Update'),
                onPressed: () {
                  Navigator.of(context).pop();
                  dbMethods.updateLessons(phpCollection,selectedItem, selectedItem, selectedItem, {
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
                          dbMethods.createLessons(phpCollection,  'Quiz', 'Classes', {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );

                        }break;
                        case 'Static Properties' : {
                          dbMethods.createLessons(phpCollection, 'Quiz', 'Static Properties', {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Static Methods' : {
                          dbMethods.createLessons(phpCollection, 'Quiz', 'Static Methods',  {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Constructors' : {
                          dbMethods.createLessons(phpCollection,  'Quiz', 'Constructors', {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Traits' : {
                          dbMethods.createLessons(phpCollection,  'Quiz', 'Traits', {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Inheritance' : {
                          dbMethods.createLessons(phpCollection, 'Quiz', 'Inheritance',  {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Access Modifiers' : {
                          dbMethods.createLessons(phpCollection,  'Quiz', 'Access Modifiers', {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Abstract Classes' : {
                          dbMethods.createLessons(phpCollection, 'Quiz', 'Abstract Classes',  {
                            'QuizFile': fileUrl,
                            'when': DateTime.now()
                          }).then((value) {
                            resultDialogAdd(context);
                          } );
                        }break;
                        case 'Namespaces' : {
                          dbMethods.createLessons(phpCollection, 'Quiz', 'Namespaces',  {
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
                      dbMethods.addExample(phpCollection, 'Examples', 'Classes', Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Namespaces': {
                      dbMethods.addExample(phpCollection,'Examples', 'Namespaces',  Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Constructors': {
                      dbMethods.addExample(phpCollection,'Examples', 'Constructors',  Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Traits': {
                      dbMethods.addExample(phpCollection,'Examples', 'Traits',  Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Inheritance': {
                      dbMethods.addExample(phpCollection,'Examples', 'Inheritance', Example1, Example2, Example1Code, Example2Code);
                    }
                    break;
                    case 'Static Properties': {
                      dbMethods.addExample(phpCollection,'Examples', 'Static Properties',  Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Static Methods': {
                      dbMethods.addExample(phpCollection,'Examples', 'Static Methods',  Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Abstract Classes': {
                      dbMethods.addExample(phpCollection,'Examples', 'Abstract Classes',  Example1, Example2, Example1Code, Example2Code).then((value) {
                        resultDialogAdd(context);
                      } );
                    }
                    break;
                    case 'Access Modifiers': {
                      dbMethods.addExample(phpCollection,'Examples', 'Access Modifiers',  Example1, Example2, Example1Code, Example2Code );
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

  Widget lessonContainer (){
    if (lessonStream != null){
      return StreamBuilder(
        stream: lessonStream,
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
                                    dbMethods.deleteLesson(phpCollection, snapshot.data.documents[i].documentID);
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
