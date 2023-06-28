import 'package:photo_separator/app/data/providers/storage_provider.dart';

class AuthRepository {
  readUser() => StorageProvider.to.readUser();
  writeUser(user) => StorageProvider.to.writeUser(user);
}
