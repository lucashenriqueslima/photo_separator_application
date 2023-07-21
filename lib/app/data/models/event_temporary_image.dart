import 'package:image_picker/image_picker.dart';

class EventTemporaryImage {
  XFile? image;
  int? size;
  String? errorMessage;

  EventTemporaryImage({this.image, this.size, this.errorMessage});
}
