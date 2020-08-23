/*
import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pr2adminpanel/services/database.dart';


class addVideo extends StatefulWidget {
  @override
  _addVideoState createState() => _addVideoState();
}
File _video;


class _addVideoState extends State<addVideo> {
  @override
  Widget build(BuildContext context) {

    Future videoDialog (BuildContext context) async {

      var random = Random(25);
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text('Upload Video'),
              content: Container (
                width: 180,
                height: 180,
                child: Column (
                  children: <Widget>[
                    Image.file(_video, width: 150, height: 150,),
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
                        final StorageReference myFirebaseStorage = FirebaseStorage.instance.ref().child('/${random.nextInt(1000).toString()}.jpg');
                        final StorageUploadTask task = myFirebaseStorage.putFile(_video);
                        var downloadUrl = await (await task.onComplete).ref.getDownloadURL();
                        String vidUrl = downloadUrl.toString();
                        await DatabaseServices().uploadVideo(vidUrl);

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
    Future getVideo () async {
      var result = await ImagePicker().getVideo(source: ImageSource.gallery);
      setState (()=> _video= File(result.path));
      return videoDialog(context);
    }
    void _showEditProfilePanel (){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: addVideo(),
        );
      });
    }
  return Scaffold()
}
*/
