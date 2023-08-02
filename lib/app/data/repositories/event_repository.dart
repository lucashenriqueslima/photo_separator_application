import 'package:photo_separator/app/data/providers/http_provider.dart';

class EventRepository {
  getAll() => HttpProvider.to.getAllEvents();
  getEventById(String id) => HttpProvider.to.getEventById(id);
  compareFaces(String id) => HttpProvider.to.compareFaces(id);
}
