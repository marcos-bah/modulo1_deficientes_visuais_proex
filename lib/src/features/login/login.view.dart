import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/login/login.controller.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/button_submit.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/form_field.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/snackbar.message.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/user.model.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/user.repository.dart';
import 'package:rx_notifier/rx_notifier.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();
  Repository repository = Repository();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: size.width < 320 ? size.width * 0.8 : 280,
            height: size.height,
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Spacer(
                    flex: 4,
                  ),
                  Text(
                    "Módulo\n1",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  FormFieldWidget(
                    title: "E-mail",
                    description: "Entre com seu email",
                    validator: (String value) {
                      if (value.isEmpty) return "Campo vazio";
                      if (value.length < 10) return "Campo muito pequeno";
                      if (!value.contains("@")) return "Falta @";
                      if (!value.contains("@")) return "Falta .";
                      return null;
                    },
                    controller: controller.emailEditingController,
                    onChanged: (value) {},
                    icon: SizedBox(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  RxBuilder(
                    builder: (context) {
                      return FormFieldWidget(
                        title: "Senha",
                        description: "Senha do sistema",
                        validator: (value) {
                          if (value.isEmpty) return "Campo vazio";
                          return null;
                        },
                        controller: controller.passwordEditingController,
                        onChanged: (value) {},
                        keyboardType: TextInputType.text,
                        obscure: !controller.getIsVisible,
                        icon: IconButton(
                          icon: !controller.getIsVisible == true
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            controller.isVisible.value =
                                !controller.getIsVisible;
                          },
                        ),
                      );
                    },
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  RxBuilder(
                    builder: (context) {
                      return controller.getIsLoading
                          ? CircularProgressIndicator()
                          : ButtonSubmitWidget(
                              textButton: "Entrar",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.isLoading.value = true;
                                  UserModel user = UserModel(
                                      controller.emailEditingController.text,
                                      controller
                                          .passwordEditingController.text);
                                  repository.login(userModel: user).then((res) {
                                    Map resJson = jsonDecode(res.toString());

                                    if (resJson["token"] != null) {
                                      showMessageSucess(
                                          context: context,
                                          text: "Sucesso ao logar");
                                      Navigator.pushNamed(context, "/home");
                                    } else {
                                      showMessageError(
                                          context: context,
                                          text: resJson["message"].toString());
                                    }
                                  }).whenComplete(
                                      () => controller.isLoading.value = false);
                                }
                              },
                            );
                    },
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/recovery-password");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Recuperar Senha",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
