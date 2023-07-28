import 'package:photo_separator/app/data/providers/http_provider.dart';

class EventIndentificationRepository {
  getAll(eventId) => HttpProvider.to.getAllEventIdentifications(eventId);

  add(tmpEventIndentification, eventId) =>
      HttpProvider.to.addEventIdentification(tmpEventIndentification, eventId);
}
