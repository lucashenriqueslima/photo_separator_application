import 'package:get/get.dart';
import 'package:photo_separator/app/data/models/event_model.dart';
import 'package:photo_separator/app/data/repositories/event_repository.dart';

class EventListController extends GetxController {
  final _repository = EventRepository();

  final RxList<Event> events = <Event>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllEvents();
  }

  Future<void> getAllEvents() async {
    final response = await _repository.getAll();
    events.value = response.data['data']
        .map<Event>((event) => Event.fromJson(event))
        .toList();
  }
}
