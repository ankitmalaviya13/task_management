import 'package:get_storage/get_storage.dart';

class StorageService {
  final GetStorage _box = GetStorage();
  // Method to save user data locally
  saveData(key, data) async {
    await _box.write(key, data);
  }

  // Method to retrieve user data from local storage
  getData(key) async {
    var data = await _box.read(key);
    return data;
  }

  // Method to remove user data (logout)
  removeData(key) async {
    await _box.remove(key);
  }
}
