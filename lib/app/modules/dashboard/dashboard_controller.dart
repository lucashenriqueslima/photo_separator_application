import 'package:get/get.dart';
import 'package:photo_separator/app/modules/event/event_create/event_create_binding.dart';
import 'package:photo_separator/app/modules/event/event_list/event_list_binding.dart';

class DashboardController extends GetxController {
  final EventListBinding eventListBinding = EventListBinding();
  final EventCreateBinding eventCreateBinding = EventCreateBinding();

  final RxInt indexPage = 0.obs;
  final List<String> titles = ['Início', 'Eventos'];
  final List<String> subtitles = ['Início', 'Eventos'];
}
