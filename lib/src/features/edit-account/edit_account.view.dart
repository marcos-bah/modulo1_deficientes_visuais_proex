import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/edit-account/edit_account.controller.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/button_submit.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/form_field.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/modal_delete.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/user.model.dart';
import 'package:rx_notifier/rx_notifier.dart';

class EditAccountView extends StatefulWidget {
  const EditAccountView({
    Key? key,
  }) : super(key: key);

  @override
  _EditAccountViewState createState() => _EditAccountViewState();
}

class _EditAccountViewState extends State<EditAccountView> {
  late EditAccountController controller;
  final _formKey = GlobalKey<FormState>();
  late UserModel userModel;

  @override
  void initState() {
    controller = EditAccountController();
    userModel = UserModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Editando Conta"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                controller.clear();
              },
              tooltip: "Apagar campos",
            ),
          )
        ],
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
                    description: "Edite o nome",
                    validator: (String value) {
                      if (value.isEmpty) return "Campo vazio";
                      if (value.length < 6) return "Campo muito pequeno";
                      return null;
                    },
                    controller: controller.nameEditingController,
                    onChanged: (value) {},
                    icon: SizedBox(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  FormFieldWidget(
                    title: "E-mail",
                    description: "Edite o e-mail",
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
                        title: "Senha Atual",
                        description: "Sua senha atual do sistema",
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
                  RxBuilder(
                    builder: (context) {
                      return FormFieldWidget(
                        title: "Nova Senha",
                        description: "Sua nova senha",
                        validator: (value) {
                          if (value.isEmpty) return "Campo vazio";
                          return null;
                        },
                        controller: controller.newPasswordEditingController,
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
                    flex: 1,
                  ),
                  RxBuilder(
                    builder: (context) {
                      return controller.getIsLoading
                          ? CircularProgressIndicator()
                          : ButtonSubmitWidget(
                              textButton: "Editar conta",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.isLoading.value = true;
                                  Future.delayed(Duration(seconds: 3)).then(
                                      (value) =>
                                          controller.isLoading.value = false);
                                }
                              },
                            );
                    },
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  TextButton(
                    onPressed: () {
                      userModel.uid = "s";
                      showDialog(
                        context: context,
                        builder: (context) => ModalDeleteWidget(
                          uid: userModel.uid,
                        ),
                      );
                    },
                    child: Text(
                      "Excluir conta",
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                    ),
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
