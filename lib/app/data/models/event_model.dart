class Event {
  int? id;
  String? status;
  String? title;
  String? description;
  dynamic place;
  dynamic localization;
  String? start;
  String? end;

  Event({
    this.id,
    this.status,
    this.title,
    this.description,
    this.place,
    this.localization,
    this.start,
    this.end,
  });

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    title = json['title'];
    description = json['description'];
    place = json['place'];
    localization = json['localization'];
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['title'] = title;
    data['description'] = description;
    data['place'] = place;
    data['localization'] = localization;
    data['start'] = start;
    data['end'] = end;
    return data;
  }
}
