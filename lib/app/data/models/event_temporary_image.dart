import 'package:image_picker/image_picker.dart';

class EventTemporaryImage {
  XFile? image;
  String? bytes;
  int? size;
  String? errorMessage;

  EventTemporaryImage({this.image, this.size, this.errorMessage});
}
