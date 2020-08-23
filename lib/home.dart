import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr2adminpanel/services/auth.dart';

class myHome extends StatefulWidget {
  @override
  _myHomeState createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  @override
  Widget build(BuildContext context) {
    AuthMethods _auth = AuthMethods();
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        actions: <Widget>[
          FlatButton.icon( onPressed: () async{
            await _auth.signOut();
          },
              icon: Icon(Icons.exit_to_app),
              label: Text('Logout')),
        ],
      ),
      drawer: Drawer(

        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView(
            
            children: <Widget>[
              ListTile(
                title: Text("here's the admin email", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

              ),
              ListTile(
                title: Text('Users Control'),
                leading: Icon(Icons.person_outline),
                onTap: (){},
              ),
              ListTile(
                title: Text('Users Control'),
                leading: Icon(Icons.person_outline),
                onTap: (){},
              ),
              ListTile(
                title: Text('Users Control'),
                leading: Icon(Icons.person_outline),
                onTap: (){},
              )
            ],

          ),
        ),
      ),
    );
  }
}
