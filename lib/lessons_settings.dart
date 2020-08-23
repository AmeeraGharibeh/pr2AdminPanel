import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class lessonSettings extends StatefulWidget {
  @override
  _lessonSettingsState createState() => _lessonSettingsState();
}

class _lessonSettingsState extends State<lessonSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lessons Collections"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text("Choose The Lesson collection you want to manage: ",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),),
              SizedBox(height: 20,),
              InkWell(
                hoverColor: Colors.grey[300],
                onTap: (){
                  Navigator.pushNamed(context, '/cSharpControl');
                },
                child: Container(
                  padding: EdgeInsets.only(left: 50, top: 20),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blueAccent[200].withOpacity(0.5),
                    ),
                    child: Text('C#',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
              ),
              SizedBox(height: 10,),
              InkWell(
                hoverColor: Colors.grey[300],
                onTap: (){
                  Navigator.pushNamed(context, '/phpControl');

                },
                child: Container(
                  padding: EdgeInsets.only(left: 50, top: 20),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blueAccent[200].withOpacity(0.5),
                  ),
                  child: Text('PHP',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
              ),
              SizedBox(height: 10,),
              InkWell(
                hoverColor: Colors.grey[300],
                onTap: (){
                  Navigator.pushNamed(context, '/javascriptControl');

                },
                child: Container(
                  padding: EdgeInsets.only(left: 50, top: 20),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blueAccent[200].withOpacity(0.5),
                  ),
                  child: Text('JavaScript',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
              ),
              SizedBox(height: 10,),
              InkWell(
                hoverColor: Colors.grey[300],
                onTap: (){
                  Navigator.pushNamed(context, '/oppBasics');

                },
                child: Container(
                  padding: EdgeInsets.only(left: 50, top: 20),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blueAccent[200].withOpacity(0.5),
                  ),
                  child: Text('OPP Basics',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
              ),
              SizedBox(height: 10,),
              InkWell(
                hoverColor: Colors.grey[300],
                onTap: (){
                  Navigator.pushNamed(context, '/courses');

                },
                child: Container(
                  padding: EdgeInsets.only(left: 50, top: 20),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blueAccent[200].withOpacity(0.5),
                  ),
                  child: Text('Courses Management',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),),
              ),
              SizedBox(height: 10,),


            ],
          ),
        ),
      ),
    );
  }
}
