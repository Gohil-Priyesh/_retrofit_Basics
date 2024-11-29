import 'package:flutter/material.dart';
import 'package:retrofit_basic_exp/main.dart';
import 'package:retrofit_basic_exp/network/injection.dart';

class DeleteApi extends StatefulWidget {
  const DeleteApi({super.key});

  @override
  State<DeleteApi> createState() => _DeleteApiState();
}

class _DeleteApiState extends State<DeleteApi> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiPartApi'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: SizedBox(
          height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    _isLoading = true;
                  });
                  /// this id is given static hear
                  restClient.DeleteApiExp('2').then((value){
                    logger.i('id deletion successful');
                    setState(() {
                      _isLoading = false;
                    });
                  }).onError((error,stackTrace){
                    logger.e('failed to delet id');
                  });
                },
                child: _isLoading ? CircularProgressIndicator() : Text('Delete Api Example')
            )
        ),
      ),
    );
  }
}
