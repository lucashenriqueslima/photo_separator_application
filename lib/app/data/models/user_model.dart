class User {
  int? id;
  int? clientId;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  bool? isAdmin;

  User(
      {this.id,
      this.clientId,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.isAdmin});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isAdmin = json['is_admin'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['client_id'] = clientId;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['is_admin'] = isAdmin;
    return data;
  }
}
