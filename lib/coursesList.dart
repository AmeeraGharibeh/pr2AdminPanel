import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pr2adminpanel/services/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class coursesList extends StatefulWidget {
  String guider;
  coursesList(this.guider);
  @override
  _coursesListState createState() => _coursesListState(this.guider);
}

class _coursesListState extends State<coursesList> {
  String guider;
  _coursesListState(this.guider);
  DatabaseServices dbMethods = new DatabaseServices();
  final CollectionReference coursesCollection = Firestore.instance.collection('coursesCollection');
  var coursesStream;
  String author,summery, title, imgPath, overview, about, timeline1, timeline2, timeline3, vid, authorPic;
  String videoTitle, videoDescription;
  File video;
  File AuthorPic;

  @override
  void initState(){
    dbMethods.getCourses(coursesCollection, guider, guider).then((value) {
      setState(() {
        coursesStream = value;
      });
    });
  }
  Future authorPicUpload (BuildContext context, String path) async {
    final _picker = ImagePicker();
    PickedFile result = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      AuthorPic = File(result.path);
    });
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
              title: Text('Upload Author Picture'),
              content: Container(
                width: 180,
                height: 180,
                child: Column (
                  children: <Widget>[
                    Image.file(AuthorPic, width: 150, height: 150,),
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
                        final StorageReference myFirebaseStorage = FirebaseStorage.instance.ref().child('/${DateTime.now().toString()}.jpg');
                        final StorageUploadTask task = myFirebaseStorage.putFile(AuthorPic);
                        var downloadUrl = await (await task.onComplete).ref.getDownloadURL().then((value) => authorPic = value);
                        String picUrl = downloadUrl.toString();

                        return await DatabaseServices().uploadAuthorPic(coursesCollection, guider,guider,path, picUrl);

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
              ]
          );
        }
    );
  }

  Widget myLessonsView () {
    if (coursesStream != null) {
      return StreamBuilder(
        stream: coursesStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
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
                          SizedBox(height: 8,),
                          Text(snapshot.data.documents[i].data['summery'], style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),),
                          SizedBox(height: 8,),
                          Text(snapshot.data.documents[i].data['Author'], style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 8,),
                          Text(snapshot.data.documents[i].data['aboutAuthor'], style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 8,),
                          Text(snapshot.data.documents[i].data['overview'], style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 8,),
                          Text(snapshot.data.documents[i].data['timeline1'], style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),)?? null,
                          SizedBox(height: 8,),
                          Text(snapshot.data.documents[i].data['timeline2'], style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),)?? null,
                          SizedBox(height: 8,),
                          Text(snapshot.data.documents[i].data['timeline3'], style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),)?? null,
                          SizedBox(height: 8,),
                          Column(
                            children: <Widget>[
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
                                      dbMethods.deleteLesson(coursesCollection, snapshot.data.documents[i].documentID);
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

                                    child: Text('Upload Video'),
                                    onPressed: (){
                                      videoDialog(context );
                                    },
                                    color: Colors.grey[300],

                                  ),
                                  FlatButton(
                                    child: Text('Upload Author Pic'),
                                    onPressed: (){
                                      authorPicUpload(context,snapshot.data.documents[i].documentID );
                                    },
                                    color: Colors.grey[300],
                                  ),
                                ],
                              )
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
  Future videoDialog (BuildContext context) async {

    final _picker = ImagePicker();
    PickedFile result = await _picker.getVideo(source: ImageSource.gallery);
    setState (()=> video= File(result.path));
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Upload Video'),
            content: Container (
              width: 300,
              height: MediaQuery.of(context).size.height - 100,
              child: SingleChildScrollView(
                child: Column (
                  children: <Widget>[

                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Description',
                      ),
                      maxLines: 15,
                      onChanged: (val){
                        videoDescription = val;
                      },
                    ),
                    Image.file(video, width: 100, height: 100,),
                    SizedBox(height: 10,),
                  ],
                ),
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
                      final StorageReference myFirebaseStorage = FirebaseStorage.instance.ref().child('/${DateTime.now().toString()}.mp4');
                      final StorageUploadTask task = myFirebaseStorage.putFile(video, StorageMetadata(contentType: 'video/mp4'));
                      var downloadUrl = await (await task.onComplete).ref.getDownloadURL().then((value) => vid = value);
                      String vidUrl = downloadUrl.toString();

                      return await DatabaseServices().uploadVideo(coursesCollection, '$guider Tutorial', '$guider Tutorial', vidUrl, videoDescription);

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

            title: Text('Update Lesson'),
            content: Container(
              width: 150,
              height: 120,
              child: SingleChildScrollView(
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
                        hintText: this.summery,

                      ),
                      onChanged: (value) {
                        this.summery= value;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: this.overview,

                      ),
                      onChanged: (value) {
                        this.overview= value;
                      },
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                        hintText: this.about,

                      ),
                      onChanged: (value) {
                        this.about= value;
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
                  dbMethods.updateCourse(coursesCollection, selectedItem, {
                    'Author' : this.author,
                    'title' : this.title,
                    'summery': this.summery,
                    'overview': this.overview,
                    'aboutAuthor': this.about,
                    'timeline1': this.timeline1,
                    'timeline2': this.timeline2,
                    'timeline3': this.timeline3,

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses List', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: myLessonsView(),
        )
        /* Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: CustomScrollView(
            slivers: <Widget>[
             SliverList(
               delegate: SliverChildListDelegate(
                 [
                   ListView.builder(
                       itemBuilder: (context, i){
                         return Container(
                           width: MediaQuery.of(context).size.width,
                           height: 100,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.all(Radius.circular(20)),
                               color: Colors.white30
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[

                             ],
                           ),
                         );
                       }
                   )
                 ]
               ),

             )
            ],
          ),
        ),*/
      ),
    );
  }
}
