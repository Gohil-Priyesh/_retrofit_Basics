import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retrofit_basic_exp/Home/DeleteApi.dart';
import 'package:retrofit_basic_exp/main.dart';
import 'package:retrofit_basic_exp/network/injection.dart';

class Multipartapi extends StatefulWidget {
  const Multipartapi({super.key});

  @override
  State<Multipartapi> createState() => _MultipartapiState();
}

class _MultipartapiState extends State<Multipartapi> {

  // image is a variable which has the image picked from the below function
  File? image;
  final _picker = ImagePicker();
  // showSpinner is use for modelProgressHUD which shows a progress circle while the image is Uploading
  bool showSpinner = false;
  // this function is for picking images from gallery
  Future getImage()async{
    logger.i('imgePicker working');
    final pickedFiles = await _picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
    if(pickedFiles != null){
      image = File(pickedFiles.path);
      // setState((){}); is use to see the instant change after picking the photo
      setState(() {});
    }else{
      logger.e('failed to pick image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteApi(),));
      },
        child: Icon(Icons.arrow_forward),
      ),
      appBar: AppBar(
        title: Text('MultiPartApi'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: ()async{
              logger.i('InkWell tapped');
              getImage();
            },
            child: Container(
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)
              ),
              child: image != null ? Image.file(image!, fit: BoxFit.fitWidth,) : Text('select image')
            ),
          ),

          SizedBox(height: 50,),

          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (){
                  if(image != null){
                    setState(() {
                      showSpinner = true;
                    });
                  }
                  restClient.MuptiPartExp(image!).then((value){
                    logger.i('image uploaded');
                    setState(() {
                      showSpinner = false;
                    });
                  }).onError((error,stackTrace){
                    logger.e('failed to up-lode image');
                  });
                },
                child: showSpinner ? CircularProgressIndicator() :Text('Upload')),
          )
        ],
      ),
    );
  }
}
