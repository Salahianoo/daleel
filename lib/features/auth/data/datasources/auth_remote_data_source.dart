import '../models/user_model.dart';

class AuthRemoteDataSource {
  UserModel? _currentUser;

  Future<UserModel> login(String email, String password) async {
    // Fake delay
    await Future.delayed(const Duration(seconds: 1));
    // Fake user
    _currentUser = UserModel(
      id: '1',
      name: 'Test User',
      email: email,
    );
    return _currentUser!;
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }

  Future<UserModel?> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _currentUser;
  }
} 