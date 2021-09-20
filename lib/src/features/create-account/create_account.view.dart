import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.repository.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/create-account/create_account.controller.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/button_submit.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/dropdown_button.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/form_field.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/snackbar.message.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/user.model.dart';
import 'package:provider/provider.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  CreateAccountController controller = CreateAccountController();
  UserModel userModel = UserModel();
  late UserModel rootModel;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    rootModel = Provider.of<UserModel>(context, listen: false);
    print(rootModel.token);
    super.initState();
  }

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
                    onChanged: (value) {
                      userModel.name = value;
                    },
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
                    onChanged: (value) {
                      userModel.email = value;
                    },
                    icon: SizedBox(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  RxBuilder(
                    builder: (context) {
                      return DropdownButtonWidget(
                        title: "Permissão",
                        onChanged: (value) {
                          userModel.permission = value;
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

                                  AppRepository repository = AppRepository();
                                  userModel.password = "proex123";
                                  print(rootModel.token.toString() + "ddd");

                                  repository
                                      .post(
                                    model: userModel,
                                    query: AppRepository.queryUser,
                                    options: Options(
                                      headers: {
                                        'Authorization':
                                            'Bearer ' + rootModel.token,
                                      },
                                    ),
                                  )
                                      .then(
                                    (value) {
                                      if (value.contains("Erro")) {
                                        showMessageError(
                                            context: context, text: value);
                                      } else {
                                        showMessageSucess(
                                            context: context, text: value);
                                        Navigator.of(context)
                                            .pushReplacementNamed('/home');
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
