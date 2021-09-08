import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/create-account/create_account.controller.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/create-account/create_account.repository.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/button_submit.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/dropdown_button.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/form_field.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/snackbar.message.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/user.model.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  CreateAccountController controller = CreateAccountController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Nova Conta"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: size.width < 320 ? size.width * 0.8 : 280,
            height: size.height - 80,
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Spacer(
                    flex: 5,
                  ),
                  FormFieldWidget(
                    title: "Nome",
                    description: "Entre com o nome",
                    validator: (String value) {
                      if (value.isEmpty) return "Campo vazio";
                      if (value.length < 6) return "Campo muito pequeno";
                      return null;
                    },
                    controller: controller.emailEditingController,
                    onChanged: (value) {},
                    icon: SizedBox(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  FormFieldWidget(
                    title: "E-mail",
                    description: "Entre com o email",
                    validator: (String value) {
                      if (value.isEmpty) return "Campo vazio";
                      if (value.length < 10) return "Campo muito pequeno";
                      if (!value.contains("@")) return "Falta @";
                      if (!value.contains("@")) return "Falta .";
                      return null;
                    },
                    controller: controller.nameEditingController,
                    onChanged: (value) {},
                    icon: SizedBox(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  RxBuilder(
                    builder: (context) {
                      return DropdownButtonWidget(
                        title: "Permissão",
                        onChanged: (value) {
                          controller.permission.value = value;
                        },
                        value: controller.getPermission,
                      );
                    },
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  RxBuilder(
                    builder: (context) {
                      return controller.getIsLoading
                          ? CircularProgressIndicator()
                          : ButtonSubmitWidget(
                              textButton: "Criar conta",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.isLoading.value = true;
                                  CreateAccountRepository repository =
                                      CreateAccountRepository();
                                  repository
                                      .createAccount(controller.getUserModel())
                                      .then(
                                    (res) {
                                      if (jsonDecode(res)["token"] != null) {
                                        showMessageSucess(
                                            context: context,
                                            text: "Sucesso ao logar");
                                        Navigator.of(context).pop();
                                      } else {
                                        showMessageError(
                                          context: context,
                                          text: "Erro ao criar conta",
                                        );
                                      }
                                    },
                                  ).whenComplete(() =>
                                          controller.isLoading.value = false);
                                }
                              },
                            );
                    },
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "A senha padrão será: proex123",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(
                    flex: 5,
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
