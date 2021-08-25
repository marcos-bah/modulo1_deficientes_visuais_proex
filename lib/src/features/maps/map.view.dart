import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/maps/map.controller.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/button_submit.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/form_field.widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  MapController controller = MapController();

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
                    title: "Nome do Mapa",
                    description: "Entre com o nome",
                    validator: controller.validator,
                    controller: controller.nameEditingController,
                    onChanged: controller.setName,
                    icon: SizedBox(),
                    keyboardType: TextInputType.name,
                  ),
                  FormFieldWidget(
                    title: "Descrição do Mapa",
                    description: "Entre com a descrição",
                    validator: controller.validator,
                    controller: controller.descriptionEditingController,
                    onChanged: controller.setDescription,
                    icon: SizedBox(),
                    keyboardType: TextInputType.text,
                  ),
                  ButtonSubmitWidget(
                    textButton: "Enviar Mapa",
                    onPressed: () {},
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  RxBuilder(
                    builder: (context) {
                      return controller.getIsLoading
                          ? CircularProgressIndicator()
                          : ButtonSubmitWidget(
                              textButton: "Criar Mapa",
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
