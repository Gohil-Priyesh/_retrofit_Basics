import 'dart:io';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit_basic_exp/models/getModel/listApiExampleModel.dart';
import 'package:retrofit_basic_exp/models/getModel/user_list_res_model.dart';
import 'package:retrofit_basic_exp/models/postModel/SingleUserPostModel.dart';
import 'package:retrofit_basic_exp/models/putModel/putApiModel.dart';
part 'api_services.g.dart';

/// i can give base url hear because i am using different i am giving it separately
@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  /// get api for multiple users
  @GET('https://reqres.in/api/users?page=2')
  Future<UserListResModel> getUsers();

  /// get api for single user
  @GET('https://reqres.in/api/users/2')
  Future<dynamic> singleUser();

  /// get api example when the api is starting from an array
  @GET('https://jsonplaceholder.typicode.com/posts')
  Future<List<ListApiExampleModel>> ListApiExample();


  /// post api wit field example
  @POST('https://reqres.in/api/users')
  Future<SingleUserPostModel> postApiExp(
      /// this field are similar to constructor which ask for a value when called
      /// pass the same key as given in the map
      @Field("name") String name,
      @Field( "job") String job,
      );

  /// any name can be given to the {id}
  /// the path my be used for changing a specific json object by giving it's id
  @PUT('https://reqres.in/api/users/{id}')
  Future<PutApiModel> PutApiExp(
      @Path('id') String id,
      @Field("name") String name,
      @Field( "job") String job,
      );

/// @PUT('https://reqres.in/api/users/{id}')
//   Future<PutApiModel> PutApiExp(
//       @Path('id') String id,
//       @Field("name") String name,
//       @Field( "job") String job,
//       );
  ///The main difference between the PUT and PATCH methods in REST API is that PUT replaces an entire resource, while PATCH modifies only a portion of it:
// PUT
// Replaces the entire resource with new data. This means that all fields of the resource are sent in the request body, even if they are not modified.
// PATCH
// Modifies a portion of an existing resource, leaving other aspects of it unmodified. This means that only the fields that need to be changed are sent in the request body.
// PATCH is less invasive than PUT because it only updates individual fields, whereas PUT replaces the resource completely.


  /// MultiPart Api
  @POST('https://fakestoreapi.com/products')
  @MultiPart()
  @Headers(<String, dynamic>{
    'Content-Type': 'multipart/form-data',
  })
  Future<dynamic> MuptiPartExp(
      /// this field are similar to constructor which ask for a value when called
      /// pass the same key as given in the map
      @Part(name: 'file') File file
      );

  @DELETE('https://reqres.in/api/users/{id}')
  Future<dynamic> DeleteApiExp(
      @Path('id') String id,
      );

  /// for passing data in the post api in the url
  //@POST('/api/users/2/{id}')
  //Future<List<dynamic>> getTasks(@Path('id')String id);

/// for passing the json as data in the post api it can be done using the @Field() or @Queries()
  /// or the @Body(). the body parameter is used for passing the entire model
  //@POST('/api/users/2')
  //Future<List<dynamic>> getTasks();
}
