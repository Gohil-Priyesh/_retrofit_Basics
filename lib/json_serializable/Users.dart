import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit_basic_exp/json_serializable/Address.dart';
part 'Users.g.dart';
@JsonSerializable(explicitToJson: true)
class Users {
  String? name, phone , email;
  bool? Subscription;
  Address? adress;

  Users({
    this.name,
    this.phone,
    this.email,
    this.Subscription,
    this.adress,
  });

  factory Users.fromJson(Map<String,dynamic> data) => _$UsersFromJson(data);

  Map<String,dynamic> toJson() => _$UsersToJson(this);
}