import 'package:meuapp/shared/models/user_model.dart';
import 'package:meuapp/shared/services/app_database.dart';
import 'package:supabase/supabase.dart';

class SupaBaseDataBase implements AppDatabase {
  late final SupabaseClient client;

  SupaBaseDataBase() {
    init();
  }
  @override
  void init() {
    client = SupabaseClient(
        //const String.fromEnvironment("SUPABASEURL"),
        //const String.fromEnvironment("SUPABASEKEY"),

        "https://bixfxoqcjfapmyrjgtyh.supabase.co",
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzOTEzNTE4NSwiZXhwIjoxOTU0NzExMTg1fQ.3-CR7GkNpRfOBq6f6eZhlY170uxbAPs0xaiBXCmhki8");
  }

  @override
  Future<UserModel> createAccount(
      {required String email,
      required String password,
      required String name}) async {
    final response = await client.auth.signUp(
      email,
      password,
    );
    if (response.error == null) {
      final user = UserModel(id: response.user!.id, email: email, name: name);
      await createUser(user);
      return user;
    } else {
      throw Exception(
          response.error?.message ?? "Não foi possível criar conta");
    }
  }

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await client.auth.signIn(
      email: email,
      password: password,
    );
    if (response.error == null) {
      final user = await getUser(response.user!.id);
      return user;
    } else {
      throw Exception(
          response.error?.message ?? "Não foi possível realizar login");
    }
  }

  @override
  Future<UserModel> createUser(UserModel user) async {
    final response = await client.from("users").insert(user.toMap()).execute();
    if (response.error == null) {
      return user;
    } else {
      throw Exception("Não foi possível cadastrar o usuário");
    }
  }

  @override
  Future<UserModel> getUser(String id) async {
    final response =
        await client.from("users").select().filter("id", "eq", id).execute();
    if (response.error == null) {
      final user = UserModel.fromMap(response.data[0]);
      return user;
    } else {
      throw Exception("Não foi possível buscar o usuário");
    }
  }
}
