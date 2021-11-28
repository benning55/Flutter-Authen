class User {
  String? id;
  String? password;
  String? email;
  String? token;
  String? refresh_token;
  String? user_id;

  User(
      {this.id,
      this.password,
      this.email,
      this.token,
      this.refresh_token,
      this.user_id});

  factory User.fromJson(Map<String, dynamic> responseData) {
    var user = User(
      id: responseData["id"],
      password: responseData["password"],
      email: responseData["email"],
      token: responseData["token"],
      refresh_token: responseData["refresh_token"],
      user_id: responseData["user_id"],
    );
    return user;
  }
}
