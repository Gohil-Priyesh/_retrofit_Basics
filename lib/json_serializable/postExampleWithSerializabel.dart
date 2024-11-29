
import 'package:json_annotation/json_annotation.dart';
part 'postExampleWithSerializabel.g.dart';

@JsonSerializable()
class Postexamplewithserializabel {
  String? id;
  String? createdAt;

  Postexamplewithserializabel({this.id, this.createdAt});

  factory Postexamplewithserializabel.fromJson(Map<String,dynamic> data) {
    return _$PostexamplewithserializabelFromJson(data);
  }

  Map<String,dynamic> toJson() {
    return _$PostexamplewithserializabelToJson(this);
  }
}