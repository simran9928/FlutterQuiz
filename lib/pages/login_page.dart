import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import './landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './list.dart';
import 'package:quizz/ui/pagest/home.dart';






class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
    
  String _email;
  String _password;
  Icon fieldIcon;
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("images/glug.png"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle:
                    new TextStyle(color: Colors.blueAccent, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100.0,
              ),
              new Container(
                padding: const EdgeInsets.all(20.0),
                child: new Form(
                  key: _formKey,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Enter Email", fillColor: Colors.blue),
                        style:TextStyle(fontSize: 20.0, color: Colors.white),
                      
                        validator: (value) => value.isEmpty ? 'Email can\'t be empty':null,
                         onSaved: (value) => _email = value,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                        ),
                        style:TextStyle(fontSize: 20.0, color: Colors.white),
                      
                        obscureText: true,
                        validator: (value) => value.length <6 ? 'Password can\'t be less than 6 characters':null,
                           onSaved: (value) => _password = value,
                           

                        ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new MaterialButton(
                        
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.green,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: new Text('LOGIN'),
                        onPressed: validateAndSave,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(90.0)
                      ),
                      new MaterialButton(
                        
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.blue,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: new Text('SIGN UP'),
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => new SignUpPage()));
     },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
    }
    Future<void> validateAndSave() async{
   final form = _formKey.currentState;
   if (form.validate()) {
     form.save();
     try{
       FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
       Navigator.push(context, MaterialPageRoute(builder: (context) => new HomePage()));
     }catch(e){
     print(e.message);
     }
   }
  }
}











class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>

    with SingleTickerProviderStateMixin  {
 String _email;
  String _password;
  Icon fieldIcon;
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState(){
    super.initState();
    animationController=AnimationController(duration:Duration(seconds: 3),vsync: this);
    animation =Tween(begin: -1.0, end:0.0).animate(CurvedAnimation(curve:Curves.fastOutSlowIn, 
    parent:animationController));
    delayedAnimation =Tween(begin: 0.5, end:0.0).animate(CurvedAnimation(curve:Interval(0.5, 1.0,curve:Curves.fastOutSlowIn), 
    parent:animationController));
    muchDelayedAnimation =Tween(begin: 0.8, end:0.0).animate(CurvedAnimation(curve:Interval(0.5, 1.0,curve:Curves.fastOutSlowIn), 
    parent:animationController));
    
  }
  
  @override
  Widget build(BuildContext context) {
    final double width= MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
      animation:animationController,
      builder:(BuildContext context, Widget child){
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("images/signup.png"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
        
  
        new Theme(
          
          data: new ThemeData(
             primaryColor: Colors.white,
              brightness: Brightness.light,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle:
                    new TextStyle(color: Colors.blueAccent, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
             Transform( 
               transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
               child: Stack(
            children: <Widget>[
              Container(
            alignment:Alignment.topLeft,
            padding:EdgeInsets.fromLTRB(0.0, 175.0, 0.0, 0.0),
            child: Text('SIGN ', style:TextStyle(
              fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.white,
            )
            ), 
            ),
            Container(
              padding:EdgeInsets.fromLTRB(200.0, 175.0, 0.0, 0.0),
            child: Text('UP', style:TextStyle(
              fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.white,
            )
            ), 
            ),
          
          Container(
            padding:EdgeInsets.fromLTRB(275.0, 175.0, 0.0, 0.0),
            child: Text('.', style:TextStyle(
              
              fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.red,
            )
            ), 
            ),
          
        ]
          
        ),
               
             ),
              
              new Container(
                padding: const EdgeInsets.only(top:35, left:20.0, right:20.0),
                child: new Form(
                  key: _formKey,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Transform( 
               transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
             
                      child: TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Enter Email", fillColor: Colors.blue),
                        style:TextStyle(fontSize: 20.0, color: Colors.white),
                        
                        validator: (value) => value.isEmpty ? 'Email can\'t be empty':null,
                         onSaved: (value) => _email = value,
                      ),
                      ),
                      Transform( 
               transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
             
                      child: TextFormField(
                        
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                        ),
                        style:TextStyle(fontSize: 20.0, color: Colors.white),
                      
                        obscureText: true,
                        validator: (value) => value.length <6 ? 'Password can\'t be less than 6 characters':null,
                           onSaved: (value) => _password = value,
                           

                        ),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        
                      ),
                      Transform( 
               transform: Matrix4.translationValues(animation.value * width, 0.0, 0.0),
             
                      child: MaterialButton(
                        
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.blue,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: new Text('SIGN UP'),
                        onPressed: signUp,
                      )
                      ),
                    ],
                  ),
                ),
              )
              
            ],
              
          ),
        ),
      ]),
    );
      }
    );
    }
  Future<void> signUp() async{
   final form = _formKey.currentState;
   if (form.validate()) {
     form.save();
     try{
       FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
       user.sendEmailVerification();
       Navigator.of(context).pop();
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => new LoginPage()));
     }catch(e){
     print(e.message);
     }
   }
  }
}



















