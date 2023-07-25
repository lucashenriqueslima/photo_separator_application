import 'package:photo_separator/app/data/providers/http_provider.dart';

class EventIdentificationRepository {
  add(bytes, name, eventId) =>
      HttpProvider.to.addEventIdentification(bytes, name, eventId);
}
