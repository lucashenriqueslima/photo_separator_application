import 'package:photo_separator/app/data/models/event_temporary_image.dart';
import 'package:photo_separator/app/data/providers/http_provider.dart';

class EventRepository {
  getAll() => HttpProvider.to.getAllEvents();
  getEventById(String id) => HttpProvider.to.getEventById(id);
  addImage(EventTemporaryImage eventTemporaryImage, int? eventId) =>
      HttpProvider.to.addEventImage(eventTemporaryImage, eventId);
}
