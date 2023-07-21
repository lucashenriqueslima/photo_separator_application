class EventImage {
  int? id;
  int? eventId;
  String? name;
  double? size;
  double? price;
  String? type;
  String? errorMessage;
  String? url;
  String? thumbnailUrl;

  EventImage({
    this.id,
    this.eventId,
    this.name,
    this.size,
    this.price,
    this.type,
    this.errorMessage,
    this.url,
    this.thumbnailUrl,
  });

  EventImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['eventId'];
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
    data['eventId'] = eventId;
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
