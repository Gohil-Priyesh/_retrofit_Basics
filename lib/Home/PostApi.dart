import 'package:flutter/material.dart';
import 'package:retrofit_basic_exp/Home/PutApi.dart';
import 'package:retrofit_basic_exp/json_serializable/postExampleWithSerializabel.dart';
import 'package:retrofit_basic_exp/main.dart';
import 'package:retrofit_basic_exp/models/postModel/SingleUserPostModel.dart';
import 'package:retrofit_basic_exp/network/injection.dart';

class Postapi extends StatefulWidget {
  const Postapi({super.key});

  @override
  State<Postapi> createState() => _PostapiState();
}

class _PostapiState extends State<Postapi> {

  bool _isLoading = false;

  /// post api Example with model
  /// model made from json to dart
  SingleUserPostModel singelUserPostApiObj = SingleUserPostModel();// object
  /// model made from json_serializable
  Postexamplewithserializabel postexamplewithserializabel = Postexamplewithserializabel();
  TextEditingController NameController = TextEditingController();
  TextEditingController JobController = TextEditingController();

  SingelUserPostExample (){
    restClient.postApiExp(NameController.text.toString(), JobController.text.toString()).then((value){
      setState(() {
        _isLoading = false;
        postexamplewithserializabel = value;
        logger.i(postexamplewithserializabel.createdAt);
        logger.i(postexamplewithserializabel.id);
      });
    }).onError((error,stackTrace){
      logger.e(error.toString());
    });
  }
@override
  void initState() {
    super.initState();
    SingelUserPostExample();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Putapi(),));
      },
        child: Icon(Icons.arrow_forward),
      ),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Post Api Example",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: NameController,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
            TextFormField(
              controller: JobController,
              decoration: InputDecoration(
                hintText: "Job",
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    _isLoading = true;
                    SingelUserPostExample();

                  });
                  /// post api without model
                  // restClient.postApiExp(NameController.text.toString(), JobController.text.toString()).then((value){
                  //   setState(() {
                  //     _isLoading = false;
                  //   });
                  //   logger.i('post successfully id ==> ${value['id']}');
                  // }).onError((error,stackTrace){
                  //   logger.e('error occurred in post api ${error.toString()}');
                  // });
                },
                child: _isLoading  ? CircularProgressIndicator() : Text('Submit')
            )
          ],
        ),
      ),
    );
  }
}
