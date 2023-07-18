class EventImage {
  int? id;
  String? name;
  double? size;
  double? price;
  String? type;
  String? errorMessage;
  String? url;
  String? thumbnailUrl;

  EventImage(
      {this.id,
      this.name,
      this.size,
      this.price,
      this.type,
      this.errorMessage,
      this.url,
      this.thumbnailUrl});

  EventImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    size = json['size'];
    price = json['price'];
    type = json['type'];
    errorMessage = json['errorMessage'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['size'] = size;
    data['price'] = price;
    data['type'] = type;
    data['errorMessage'] = errorMessage;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
