import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:photo_separator/app/core/keys/storage_keys.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();
  
  late GetStorage _box;

  Future<StorageService> init() async {
    _box = GetStorage();
    await _box.writeIfNull(userKey, {});
    return this;
  }

  T read<T>(String key) {
    return _box.read(key)?.cast<String, dynamic>();
  }

  void write<T>(String key, T value) {
    _box.write(key, value);
  }
}
