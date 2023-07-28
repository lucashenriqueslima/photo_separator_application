import 'package:photo_separator/app/data/models/event_image_model.dart';
import 'package:photo_separator/app/data/providers/http_provider.dart';

class EventImageRepository {
  getAll(eventId) => HttpProvider.to.getAllEventImages(eventId);

  add(EventImage tmpEventImages, String eventId) =>
      HttpProvider.to.addEventImage(tmpEventImages, eventId);
}
