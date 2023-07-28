//TODO: make a named constructor for temporary data
//TODO: Rename to Indentification
class EventIdentification {
  int? id;
  String? name;
  String? bytes;
  String? url;
  String? size;
  String? errorMessage;

  EventIdentification.tmp({
    this.bytes,
    this.name,
  });

  EventIdentification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  static List<EventIdentification> fromJsonList(List<dynamic> json) {
    final list = <EventIdentification>[];

    for (final item in json) {
      list.add(EventIdentification.fromJson(item));
    }

    return list;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = bytes;
    return data;
  }
}
