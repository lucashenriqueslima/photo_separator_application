import 'package:photo_separator/app/data/models/event_temporary_image.dart';
import 'package:photo_separator/app/data/providers/http_provider.dart';

class EventImageRepository {
  add(EventTemporaryImage eventTemporaryImage, String eventId) =>
      HttpProvider.to.addEventImage(eventTemporaryImage, eventId);
}
