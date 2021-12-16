import 'package:flutter/material.dart';
import 'package:meuapp/modules/login/pages/create_account/create_account_controller.dart';
import 'package:meuapp/modules/login/pages/create_account/repositories/login_repository_impl.dart';
import 'package:meuapp/shared/services/app_database.dart';
import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:meuapp/shared/widgets/button/button.dart';
import 'package:meuapp/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  late final CreateAccountController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    controller = CreateAccountController(
      repository: LoginRepositoryImpl(database: AppDatabase.instance),
    );
    controller.addListener(() {
      controller.state.when(
          success: (value) => Navigator.pop(context),
          error: (message, _) => scaffoldKey.currentState!.showBottomSheet(
                (context) => BottomSheet(
                  onClosing: () {},
                  // ignore: avoid_unnecessary_containers
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
      appBar: AppBar(
        backgroundColor: AppTheme.Colors.background,
        leading: BackButton(
          color: AppTheme.Colors.backbutton,
        ),
        elevation: 0,
      ),
      backgroundColor: AppTheme.Colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Criando uma conta",
                  style: AppTheme.textStyles.title,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Mantenha suas gastos em dia",
                  style: AppTheme.textStyles.subtitle,
                ),
                const SizedBox(
                  height: 40,
                ),
                InputText(
                  label: "Nome",
                  hint: "Digite seu nome completo",
                  onChanged: (value) => controller.onChage(name: value),
                  validator: (value) =>
                      value.isNotEmpty ? null : "Digite seu nome completo",
                ),
                const SizedBox(
                  height: 18,
                ),
                InputText(
                  label: "E-mail",
                  hint: "Digite seu e-mail",
                  onChanged: (value) => controller.onChage(email: value),
                  validator: (value) =>
                      isEmail(value) ? null : "Digite um email válido",
                ),
                const SizedBox(
                  height: 18,
                ),
                InputText(
                  label: "Senha",
                  obscure: true,
                  hint: "Digite sua senha",
                  onChanged: (value) => controller.onChage(password: value),
                  validator: (value) => value.length >= 6
                      ? null
                      : "Digite uma senha com mais de 6 dígitos",
                ),
                const SizedBox(
                  height: 14,
                ),
                AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) => controller.state.when(
                    loading: () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    ),
                    orElse: () => Button(
                      label: "Criar conta",
                      onTap: () {
                        controller.create();
                      },
                      type: ButtonType.fill,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
