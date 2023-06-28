import 'package:photo_separator/app/core/keys/storage_keys.dart';
import 'package:photo_separator/app/core/services/storage/storage_service.dart';
import 'package:photo_separator/app/data/models/user_model.dart';

class StorageProvider {
  static StorageProvider get to => StorageProvider(); 

  User? readUser() {
    final userData = StorageService.to.read(userKey);
    if (userData != null && userData is Map<String, dynamic>) {
      return User.fromJson(userData);
    }
    return null;
  }

  void writeUser(User user) {
    StorageService.to.write(userKey, user.toJson());
  }
}
