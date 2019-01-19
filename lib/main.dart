import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

const URL = "https://google.com/";
void main() =>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "link app",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future launchURL(String url) async{
    if (await canLaunch(url)){
      await launch(url,forceSafariVC: true,forceWebView: true);
    }else
    {
      print("can't launch ${url}");
    }

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("your link is here"),
      ),
      body:new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/google_pic.jpg"),
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
        
        new Center(
        child: Column(
          children: <Widget>[
           Container(
              padding:EdgeInsets.all(0.5),
              child: Text(URL),

           ),
           RaisedButton(
             child: Text("open link"),
             onPressed: (){
               launchURL(URL);
             },

           )
          ],
        ),
      ),
        ],
      )
    );
  }
}