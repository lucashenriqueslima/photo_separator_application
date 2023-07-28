//TODO: make a named constructor for temporary data
//TODO: Rename to Image

import 'package:image_picker/image_picker.dart';

class EventImage {
  int? id;
  int? eventId;
  XFile? image;
  String? bytes;
  int? size;
  String? errorMessage;
  String? name;
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

  EventImage.tmp({
    this.image,
    this.size,
    this.errorMessage,
  });

  EventImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    size = json['size'];
    price = json['price'];
    type = json['type'];
    status = json['status'];
  }

  static List<EventImage> fromJsonList(List<dynamic> json) {
    final list = <EventImage>[];

    for (final item in json) {
      list.add(EventImage.fromJson(item));
    }

    return list;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = bytes;
    data['size'] = size;
    data['price'] = price;
    data['type'] = type;
    data['status'] = status;
    return data;
  }
}
