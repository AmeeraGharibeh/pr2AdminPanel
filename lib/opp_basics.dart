import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr2adminpanel/services/database.dart';

// ignore: camel_case_types
class oppBasics extends StatefulWidget {
  @override
  _oppBasicsState createState() => _oppBasicsState();
}
final CollectionReference OppBasics = Firestore.instance.collection('OPPBasics');


String title, content;
DatabaseServices dbMethods = new DatabaseServices();
class _oppBasicsState extends State<oppBasics> {
  String title, content;
  var basicsStream;
  DatabaseServices dbMethods = new DatabaseServices();


  @override
  void initState() {
    dbMethods.getBasics(OppBasics).then((value) {
      setState(() {
        basicsStream = value;
      });
      //switch ()
    });

  }
  Future <void> addLessons (BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,

        builder: (BuildContext context) {
          return AlertDialog(
            title: Text ('OPP Basics'),
            content: Container(
              width: 700,
              height: 600,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the Title',
                      ),
                      onChanged: (value){
                        this.title = value;
                      },
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter the Content',
                      ),
                      maxLines: 6,
                      onChanged: (value){
                        this.content = value;
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
                  dbMethods.createBasics(
                      OppBasics, {
                    'title': this.title,
                    'content': this.content,
                    'when': DateTime.now(),
                  }
                  );
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


  Future updateDialog (BuildContext context , selectedItem) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(

            title: Text('Update '),
            content: Container(
              width: 150,
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: this.title,

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
                  dbMethods.updateBasics(OppBasics, selectedItem, {
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
  Widget myLessonsView () {
    if (basicsStream != null) {
      return StreamBuilder(
        stream: basicsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: new Container(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey[200]
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
                          SizedBox(height: 20,),
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
                                  dbMethods.deleteLesson(OppBasics, snapshot.data.documents[i].documentID);
                                },
                                color: Colors.grey[300],

                              ),

                            ],
                          ),
                          SizedBox(height: 10,),



                        ],
                      ),

                    ),
                  );
                }
            );
          } else {
            return Text ('Loading');
          }
        },
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OPP Basics Lessons Manage'),
        actions: <Widget>[
          FlatButton.icon (icon: Icon (Icons.add, ),
            label: Text('Add'),
            onPressed: (){
              addLessons(context);
            },
          ),

        ],
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: myLessonsView(),
      ),
    );
  }
}
