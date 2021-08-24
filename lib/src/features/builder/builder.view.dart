import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/builder/builder.controller.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/button_submit.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/form_field.widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

class BuilderView extends StatefulWidget {
  const BuilderView({Key? key}) : super(key: key);

  @override
  _BuilderViewState createState() => _BuilderViewState();
}

class _BuilderViewState extends State<BuilderView> {
  BuilderController controller = BuilderController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Novo Prédio"),
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
                    title: "Nome do Prédio",
                    description: "Entre com o nome",
                    validator: controller.validator,
                    controller: controller.nameEditingController,
                    onChanged: controller.setName,
                    icon: SizedBox(),
                    keyboardType: TextInputType.name,
                  ),
                  FormFieldWidget(
                    title: "Latitude do Ponto Referencia",
                    description: "Entre com a latitude do ponto referencia",
                    validator: controller.validator,
                    controller: controller.latEditingController,
                    onChanged: controller.setLat,
                    icon: SizedBox(),
                    keyboardType: TextInputType.number,
                  ),
                  FormFieldWidget(
                    title: "Longitude do Ponto Referencia",
                    description: "Entre com a longitude do ponto referencia",
                    validator: controller.validator,
                    controller: controller.lonEditingController,
                    onChanged: controller.setLon,
                    icon: SizedBox(),
                    keyboardType: TextInputType.number,
                  ),
                  FormFieldWidget(
                    title: "Descrição do Prédio",
                    description: "Entre com a descrição do prédio",
                    validator: controller.validator,
                    controller: controller.descriptionEditingController,
                    onChanged: controller.setDescription,
                    icon: SizedBox(),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  RxBuilder(
                    builder: (context) {
                      return controller.getIsLoading
                          ? CircularProgressIndicator()
                          : ButtonSubmitWidget(
                              textButton: "Criar Prédio",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                            );
                    },
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
