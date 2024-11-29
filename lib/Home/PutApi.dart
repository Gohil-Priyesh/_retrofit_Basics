import 'package:flutter/material.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit_basic_exp/Home/multiPartApi.dart';
import 'package:retrofit_basic_exp/main.dart';
import 'package:retrofit_basic_exp/models/putModel/putApiModel.dart';
import 'package:retrofit_basic_exp/network/injection.dart';

class Putapi extends StatefulWidget {
  const Putapi({super.key});

  @override
  State<Putapi> createState() => _PutapiState();
}

class _PutapiState extends State<Putapi> {
  var _isLoading = false;
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _jobController = TextEditingController();
  PutApiModel putApiModel = PutApiModel();
  PutApiExamplefunction (){
    restClient.PutApiExp(_idController.text.toString(), _nameController.text.toString(), _jobController.text.toString()).then((value){
      setState(() {
        _isLoading = false;
        putApiModel = value;
        logger.i('updatedAt ==>: ${value.updatedAt}');
      });
    }).onError((error,stackTrace){
      logger.e(error.toString());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>Multipartapi(),));
      },
        child: Icon(Icons.arrow_forward),
      ),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "put Api Example",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _idController,
              decoration: InputDecoration(
                hintText: "id",
              ),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
            TextFormField(
              controller: _jobController,
              decoration: InputDecoration(
                hintText: "Job",
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    _isLoading = true;
                    PutApiExamplefunction();
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
