class UserModel {
  String? uid;
  String? email;
  String? photoUrl;
  String? name;
  String? phone;
  UserModel({
    this.uid,
    this.email,
    this.photoUrl,
    this.name,
    this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    name = json['name'];
    phone = json['phone'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['name'] = this.name;
    data['phone'] = this.phone;

    return data;
  }
}
