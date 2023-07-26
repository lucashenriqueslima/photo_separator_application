//TODO: make a named constructor for temporary data
//TODO: Rename to Indentification
class EventIdentification {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? bytes;
  String? image;

  EventIdentification({this.id, this.name, this.email, this.phone, this.image});

  EventIdentification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    return data;
  }
}
