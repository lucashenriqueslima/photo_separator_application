//TODO: make a named constructor for temporary data
//TODO: Rename to Image

class EventImage {
  int? id;
  int? eventId;
  String? name;
  int? size;
  double? price;
  String? type;
  String? status;

  EventImage({
    this.id,
    this.name,
    this.size,
    this.price,
    this.type,
    this.status,
  });

  EventImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    size = json['size'];
    price = json['price'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['size'] = size;
    data['price'] = price;
    data['type'] = type;
    data['status'] = status;
    return data;
  }
}
