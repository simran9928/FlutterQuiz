import 'package:flutter/material.dart';
import './landing_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() { return new _LoginPageState();
    
  }
}

class _LoginPageState extends State<LoginPage> {

  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  Icon fieldIcon;

  void validateAndSave(){
   final form = formKey.currentState;
   if (form.validate()) {
     print('Form is valid. Email: $_email, password: $_password');
   }
   else{
     print('Form is invalid');
   }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      
      
      appBar: new AppBar(

      ),
      
      body:  
      new Container(
 
        
        padding: EdgeInsets.all(16.0),
        
        child:
         new Form(
          key: formKey,
          child: new Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            children: <Widget>[
              new TextFormField(
              decoration: new InputDecoration(labelText: 'Email'),
              validator: (value) => value.isEmpty ? 'Email can\'t be empty':null,
              onSaved: (value) => _email = value,
              ),
              new TextFormField(
              decoration: new InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) => value.isEmpty ? 'Password can\'t be empty':null,
              onSaved: (value) => _password = value,
              ),
              new RaisedButton(
                
                child: new Text('Done', style: new TextStyle(fontSize: 20.0)),
                onPressed: validateAndSave,
              ),
               
              new RaisedButton (
                elevation: 10.0,
                child: Container(
                  width: 150,
                   alignment: Alignment.bottomCenter,
                  child: new Text( 'LOGIN', style: new TextStyle(fontSize: 20.0), ), 
                   ),  
                    onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quizz()));}, color: Colors.blueAccent, textColor: Colors.black, shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))), 
              
              ),
            ],
          ),
        )
      )
    );
  }
}