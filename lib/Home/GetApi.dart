import 'package:flutter/material.dart';
import 'package:retrofit_basic_exp/Home/PostApi.dart';
import 'package:retrofit_basic_exp/models/getModel/listApiExampleModel.dart';
import 'package:retrofit_basic_exp/models/getModel/user_list_res_model.dart';
import 'package:retrofit_basic_exp/network/injection.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /// api with model
 UserListResModel userList = UserListResModel();
  bool isloading = true;
  fetchList(){
    restClient.getUsers().then((value){
      setState(() {
        isloading = false;
        /// passing the value(data) into the model which is received from the api
        userList = value;
      });
    }).onError((error,stackTrace){
      print("Error${error.toString()}");
    });
  }

  /// practice for get api /// api without model
  var apiResponse;
  singleUserExp(){
    restClient.singleUser().then((value){
     setState(() {
       isloading = false;
       apiResponse = value;
     });
    }).onError((error,stackTrace){
      print('Error${error.toString()}');
      setState(() {
        isloading = false;
      });
    });
  }


  /// when the api start whit an Array
  List<ListApiExampleModel> exampleListApi = [];
 ListApiExample(){
   restClient.ListApiExample().then((value){
     setState(() {
       isloading = false;
       exampleListApi = value;
     });
   }).onError((error,stackTrace){
     print('Error${error.toString()}');
   });
 }

  @override
  void initState() {
    super.initState();
    fetchList();
    singleUserExp();
    ListApiExample();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Postapi(),));
      },
        child: Icon(Icons.arrow_forward),
      ),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Get Api Example",
        ),
      ),

      body: isloading ? Center(child: CircularProgressIndicator(),)
           : ListView.builder(
        itemCount: exampleListApi.length,
        itemBuilder: (context, index) {
          return ListTile(
            /// setting the data from the model into text
            title: Text(exampleListApi[index].title?? ''),
            subtitle: Text(exampleListApi[index].body ?? ''),
          );
        },),
    );
  }
}

/// Api with model
/*
body: isloading ? Center(child: CircularProgressIndicator(),)
    : ListView.builder(
itemCount: userList.data!.length,
itemBuilder: (context, index) {
return ListTile(
/// setting the data from the model into text
title: Text(userList.data![index].firstName?? ''),
subtitle: Text(userList.data![index].email ?? ''),
);
},),
*/


/// calling api without any model or list
/*
body: isloading ? Center(child: CircularProgressIndicator(),)
    : (apiResponse == null || apiResponse.isEmpty)
? Center(child: Text('no data available'),) : ListView.builder(
itemCount: apiResponse.length,
itemBuilder: (context, index) {
return ListTile(
/// setting the data from the model into text
title: Text(apiResponse["data"]["first_name"]?? ''),
subtitle: Text(apiResponse["data"]["email"] ?? ''),
);
},),*/


/// api which begins with ArrayList
/*
body: isloading ? Center(child: CircularProgressIndicator(),)
    : ListView.builder(
itemCount: exampleListApi.length,
itemBuilder: (context, index) {
return ListTile(
/// setting the data from the model into text
title: Text(exampleListApi[index].title?? ''),
subtitle: Text(exampleListApi[index].body ?? ''),
);
},),*/
