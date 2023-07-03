import 'package:photo_separator/app/data/providers/http_provider.dart';
import 'package:photo_separator/app/data/providers/storage_provider.dart';

class AuthRepository {
  login(email, password) => HttpProvider.to.login(email, password);
  readUser() => StorageProvider.to.readUser();
  writeUser(user) => StorageProvider.to.writeUser(user);
}
