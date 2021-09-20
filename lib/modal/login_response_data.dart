
class LoginResponseData {
  int id;
  String name;
  String email;
  Null emailVerifiedAt;
  String password;
  Null rememberToken;

  LoginResponseData(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.rememberToken});

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['remember_token'] = this.rememberToken;
    return data;
  }
}
