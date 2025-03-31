import '../models/user.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';

class UserRepository {
  final ApiService _apiService = ApiService();
  final StorageService _storageService = StorageService();

  Future<List<User>> getUsers() async {
    return await _apiService.fetchUsers();
  }

  Future<void> saveUser(User user) async {
    await _storageService.saveUser(user);
  }

  Future<User?> getSavedUser() async {
    return await _storageService.getSavedUser();
  }
}
