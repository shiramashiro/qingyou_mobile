class User {
  int? id;
  String? psw;
  String? uname;
  String? email;
  String? phone;
  String? createdDate;
  String? birthday;
  String? signature;
  String? sex;
  String? location;
  String? constellation;
  int? age;
  String? avatar;
  String? occupation;
  String? salt;

  User({
    this.id,
    this.psw,
    this.uname,
    this.email,
    this.phone,
    this.createdDate,
    this.birthday,
    this.signature,
    this.sex,
    this.location,
    this.constellation,
    this.age,
    this.avatar,
    this.occupation,
    this.salt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    psw = json['psw'];
    uname = json['uname'];
    email = json['email'];
    phone = json['phone'];
    createdDate = json['createdDate'];
    birthday = json['birthday'];
    signature = json['signature'];
    sex = json['sex'];
    location = json['location'];
    constellation = json['constellation'];
    age = json['age'];
    avatar = json['avatar'];
    occupation = json['occupation'];
    salt = json['salt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['psw'] = psw;
    data['uname'] = uname;
    data['email'] = email;
    data['phone'] = phone;
    data['createdDate'] = createdDate;
    data['birthday'] = birthday;
    data['signature'] = signature;
    data['sex'] = sex;
    data['location'] = location;
    data['constellation'] = constellation;
    data['age'] = age;
    data['avatar'] = avatar;
    data['occupation'] = occupation;
    data['salt'] = salt;
    return data;
  }
}
