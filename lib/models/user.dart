class UserModel {
  String? uid;
  String? email;
  String? photoUrl;
  String? name;
  String? phone;
  String? date;
  
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
    date = json['datetime'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['photoUrl'] = this.photoUrl;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['datetime'] = this.date;

    return data;
  }
}
