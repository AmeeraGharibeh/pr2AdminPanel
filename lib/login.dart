import 'package:flutter/material.dart';
import 'package:pr2adminpanel/isLoading.dart';
import 'package:pr2adminpanel/services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   String _email, _password;
  final formKey = GlobalKey<FormState>();
   AuthMethods authMethods = new AuthMethods();
   bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading ? Loading() :  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 110, left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text ('Admin Log In', style: TextStyle(fontSize: 30, color: Colors.indigo),),

              Form (
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      validator: (val) {
                        return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val)
                            ? null
                            : 'Please Enter A Valid Email';
                      },

                      onChanged: (val) {
                        setState(() => _email = val);
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.pink[200],
                        ),
                        focusedBorder:
                        UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.pinkAccent,
                          ),
                        ),
                        labelText: "Email: ",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (val) {
                        return val.length < 6
                            ? 'Passowrd Must Be More Than 6 Charecters '
                            : null;
                      },

                      onChanged: (val) {
                        setState(() => _password = val);
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.security,
                          color: Colors.pink[200],
                        ),
                        focusedBorder:
                        UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.pinkAccent,
                          ),
                        ),
                        labelText: "Password: ",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Align(
                alignment: Alignment.center
                ,
                child: RaisedButton(
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      setState(() => isLoading = true );
                      dynamic result= authMethods.signInWithEmailAndPassowrd(_email, _password);
                      if (result == null) {
                        setState(() {
                          isLoading = false;

                        });
                      }
                    }
                  },
                  child: Text('Log in'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
