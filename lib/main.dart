
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

//import 'package:firebase_storage/firebase_storage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "welcome to camera app",
      home: MyHomePage(),
          );
        }
      }
      
class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyHomePageState();
      }
    }
    
class _MyHomePageState extends State<MyHomePage> {

 File _imageFile;

 Future getImage (bool isCamera) async{

   File image;

   if(isCamera){
     image=await ImagePicker.pickImage(source: ImageSource.camera);
   }else {
     image=await ImagePicker.pickImage(source: ImageSource.gallery);
   }
   setState(() {
     _imageFile=image;
   });
 }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Camera"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
                  child: Column(
            children: <Widget>[

              RaisedButton(
                 child: Text('Camera'),
                 
                 onPressed: (){
                   getImage(true);

                 },
              ),
               
              SizedBox(height: 10.0,),

              RaisedButton(
                child: Text('Gallery'),
                onPressed: (){
                  getImage(false);
                },
              ),
              
              _imageFile==null ? Container() :Image.file(_imageFile,width:250.0,height: 250.0,),

              

              RaisedButton(
                child: Text('Upload to storage'),
                onPressed: (){

                },
              )

            ],
          ),
        ),
      ),
    );
  }
}

