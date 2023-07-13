class IdentificationImage {
  String? id;
  String? name;
  double? size;
  String? url;

  IdentificationImage({this.id, this.name, this.size, this.url});

  IdentificationImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['size'] = size;
    data['url'] = url;
    return data;
  }
}
