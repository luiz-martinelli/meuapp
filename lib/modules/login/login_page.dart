import 'package:flutter/material.dart';
import 'package:meuapp/modules/login/login_controller.dart';
import 'package:meuapp/modules/login/pages/create_account/repositories/login_repository_impl.dart';
import 'package:meuapp/shared/services/app_database.dart';
import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:meuapp/shared/widgets/button/button.dart';
import 'package:meuapp/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    controller = LoginController(
      repository: LoginRepositoryImpl(database: AppDatabase.instance),
    );
    controller.addListener(() {
      controller.state.when(
          success: (value) =>
              Navigator.pushNamed(context, "/home", arguments: value),
          error: (message, _) => scaffoldKey.currentState!.showBottomSheet(
                (context) => BottomSheet(
                  onClosing: () {},
                  builder: (context) => Container(
                    child: Text(message),
                  ),
                ),
              ),
          orElse: () {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.Colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 200,
              ),
              InputText(
                label: "E-mail",
                hint: "Digite seu e-mail",
                validator: (value) =>
                    isEmail(value) ? null : "Digite um email válido",
                onChanged: (value) => controller.onChage(email: value),
              ),
              const SizedBox(
                height: 18,
              ),
              InputText(
                label: "Senha",
                obscure: true,
                hint: "Digite sua senha",
                onChanged: (value) => controller.onChage(password: value),
                validator: (value) =>
                    value.length >= 6 ? null : "Digite uma senha válida",
              ),
              const SizedBox(
                height: 14,
              ),
              AnimatedBuilder(
                animation: controller,
                builder: (_, __) {
                  return controller.state.when(
                    loading: () => const CircularProgressIndicator(),
                    orElse: () => Column(
                      children: [
                        Button(
                          label: "Entrar",
                          onTap: () {
                            controller.login();
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Button(
                          label: "Criar conta",
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/login/create-account",
                            );
                          },
                          type: ButtonType.outline,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
