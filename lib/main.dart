
import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/login_page.dart';

void main(){
  runApp(
      new MaterialApp(
        home: new FlutterQuiz(),
      )
  );
}

class FlutterQuiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return new FlutterQuizState();
  }
}

class FlutterQuizState extends State<FlutterQuiz>{
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Multiple Choice Quiz"),
       backgroundColor: Colors.yellowAccent[10],
     ),


     body: new Container(
       color:Colors.green[100],
       
       
          margin: const EdgeInsets.all(15.0),
          child: new Column(
          
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.center,
         
         children: <Widget>[
           Material(
             
             elevation: 100.0,
             child: Padding(
               padding: EdgeInsets.all(30.0),
           child: Image.asset('images/glug.png' , width: 100, height: 100 ),
             )),
           new MaterialButton(
             height: 50.0,
               color: Colors.green,
               onPressed: startQuiz,
               child: new Text("Let's Start",
                 style: new TextStyle(
                     fontSize: 18.0,
                     color: Colors.white
                 ),)
           )
         ],
       ),
     ),


   );
  }

  void startQuiz(){
   setState(() {
     Navigator.push(context, new MaterialPageRoute(builder: (context)=> new LoginPage()));
   });
  }
  
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.red,                  
      ),
      home: new LoginPage()
    );
  }
}