import 'package:meuapp/shared/models/user_model.dart';
import 'package:meuapp/shared/services/app_database.dart';

import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AppDatabase database;
  LoginRepositoryImpl({
    required this.database,
  });
  @override
  Future<UserModel> createAccount(
      {required String email,
      required String password,
      required String name}) async {
    final response = await database.createAccount(
        email: email, password: password, name: name);
    return response;
  }

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await database.login(
      email: email,
      password: password,
    );
    return response;
  }
}
