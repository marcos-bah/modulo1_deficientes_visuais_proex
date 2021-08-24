import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/organization/organization.controller.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/button_submit.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/form_field.widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

class OrganizationView extends StatefulWidget {
  const OrganizationView({Key? key}) : super(key: key);

  @override
  _OrganizationViewState createState() => _OrganizationViewState();
}

class _OrganizationViewState extends State<OrganizationView> {
  OrganizationController controller = OrganizationController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Nova Organização"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Container(
          width: size.width < 320 ? size.width * 0.8 : 280,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FormFieldWidget(
                    title: "Nome da Organização",
                    description: "Entre com o nome",
                    validator: controller.validator,
                    controller: controller.nameEditingController,
                    onChanged: controller.setName,
                    icon: SizedBox(),
                    keyboardType: TextInputType.name,
                  ),
                  FormFieldWidget(
                    title: "CEP",
                    description: "Entre com o CEP",
                    validator: controller.validator,
                    controller: controller.cepEditingController,
                    onChanged: controller.setCep,
                    icon: SizedBox(),
                    keyboardType: TextInputType.number,
                  ),
                  FormFieldWidget(
                    title: "Estado",
                    description: "Entre com o Estado",
                    validator: controller.validator,
                    controller: controller.stateEditingController,
                    onChanged: controller.setState,
                    icon: SizedBox(),
                    keyboardType: TextInputType.text,
                  ),
                  FormFieldWidget(
                    title: "Cidade",
                    description: "Entre com a Cidade",
                    validator: controller.validator,
                    controller: controller.cityEditingController,
                    onChanged: controller.setCity,
                    icon: SizedBox(),
                    keyboardType: TextInputType.text,
                  ),
                  FormFieldWidget(
                    title: "Bairro",
                    description: "Entre com o Bairro",
                    validator: controller.validator,
                    controller: controller.neighborhoodEditingController,
                    onChanged: controller.setNeighborhood,
                    icon: SizedBox(),
                    keyboardType: TextInputType.text,
                  ),
                  FormFieldWidget(
                    title: "Rua",
                    description: "Entre com a Rua",
                    validator: controller.validator,
                    controller: controller.streetEditingController,
                    onChanged: controller.setStreet,
                    icon: SizedBox(),
                    keyboardType: TextInputType.text,
                  ),
                  FormFieldWidget(
                    title: "Número",
                    description: "Entre com o Número",
                    validator: controller.validator,
                    controller: controller.numberEditingController,
                    onChanged: controller.setNumber,
                    icon: SizedBox(),
                    keyboardType: TextInputType.number,
                  ),
                  RxBuilder(
                    builder: (context) {
                      return controller.getIsLoading
                          ? CircularProgressIndicator()
                          : ButtonSubmitWidget(
                              textButton: "Criar Organizaçãoo",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                            );
                    },
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
