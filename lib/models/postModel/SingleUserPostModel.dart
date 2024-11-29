class SingleUserPostModel {
  String? id;
  String? createdAt;

  SingleUserPostModel({this.id, this.createdAt});

  SingleUserPostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    createdAt = json['createdAt'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    return data;
  }
}