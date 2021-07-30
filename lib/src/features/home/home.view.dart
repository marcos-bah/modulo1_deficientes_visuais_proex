import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/recovery-password/recovery_password.controller.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/button_submit.widget.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/form_field.widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  RecoveryPasswordController controller = RecoveryPasswordController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
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
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.maps_ugc),
                      title: Text("Inserir mapa"),
                      onTap: () {
                        Navigator.of(context).pushNamed("/insert-map");
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.map),
                      title: Text("Visualizar mapa"),
                      onTap: () {
                        Navigator.of(context).pushNamed("/view-map");
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.manage_accounts),
                      title: Text("Inserir usuário"),
                      onTap: () {
                        Navigator.of(context).pushNamed("/insert-user");
                      },
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
