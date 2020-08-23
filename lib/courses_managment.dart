import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr2adminpanel/coursesList.dart';
import 'package:pr2adminpanel/services/database.dart';


// ignore: camel_case_types
class coursesManagement extends StatefulWidget {
  @override
  _coursesManagementState createState() => _coursesManagementState();
}
final CollectionReference coursesCollection = Firestore.instance.collection('coursesCollection');


String title, content;
DatabaseServices dbMethods = new DatabaseServices();
class _coursesManagementState extends State<coursesManagement> {
  String author,summery, title, imgPath, overview, about, timeline1, timeline2, timeline3, vid, authorPic;
  String videoTitle;
  var coursesStream;
  DatabaseServices dbMethods = new DatabaseServices();


  @override
  void initState() {

    dbMethods.getCourses(coursesCollection, 'titles', 'titles' ).then((value) {
      setState(() {
        coursesStream = value;
      });
    });
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
                        hintText: 'Author Name',
                      ),
                      onChanged: (value){
                        this.author = value;
                      },
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Course Title',
                      ),
                      onChanged: (value){
                        this.title = value;
                      },
                    ),
                    SizedBox(height: 5,),

                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Course Summery',
                      ),
                      maxLines: 6,
                      onChanged: (value){
                        this.summery = value;
                      },
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Course Overview',
                      ),
                      maxLines: 6,
                      onChanged: (value){
                        this.overview = value;
                      },
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter first Timeline',
                      ),
                      onChanged: (value){
                        this.timeline1 = value;
                      },
                    ),
                    SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter second Timeline',
                      ),
                      onChanged: (value){
                        this.timeline2 = value;
                      },
                    ),SizedBox(height: 5,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter third Timeline',
                      ),
                      onChanged: (value){
                        this.timeline3 = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'About the Author',
                      ),
                      maxLines: 6,
                      onChanged: (value){
                        this.about = value;
                      },
                    ),
                    SizedBox(height: 5,),


                  ],
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Add'),
                onPressed: (){
                  Navigator.of(context).pop();
                  dbMethods.createCourse(coursesCollection,title, title, {
                    'Author' : this.author,
                    'title' : this.title,
                    'summery': this.summery,
                    'overview': this.overview,
                    'timeline1': this.timeline1,
                    'timeline2': this.timeline2,
                    'timeline3': this.timeline3,
                    'aboutAuthor': this.about,
                    'when': DateTime.now(),
                  }).then((value) {
                    dbMethods.category(coursesCollection, 'titles', 'titles', {
                      'title': title,
                      'Author' : this.author,
                      'when': DateTime.now()
                    });
                    resultDialogAdd(context);
                  } );

                },
              ),

            ],
          );
        }
    );
  }
/*Widget myCoursesList (){
    if (coursesStream!= null) {
     return StreamBuilder(
       stream: coursesStream,
       builder: (context, snapshot){

       },
     );
    }else {
      return Text('Loading....');
    }
}*/
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title: Text('Courses Management'),
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: StreamBuilder(
          stream: coursesStream,
          builder: (context, snapshot){
            if (snapshot.hasData){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
                child: ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, i){
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.blue[100],
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(snapshot.data.documents[i].data['title'], style: TextStyle(color: Colors.black45, fontSize: 18, fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                FlatButton.icon(
                                    onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=> coursesList(snapshot.data.documents[i].data['title'])));

                                    },
                                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                                    label: Container()
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              );
            }else{
              return Text('Loading..');
            }
          },
        ),
      )
    );
  }
}
