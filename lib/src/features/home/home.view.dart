import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
                    title: Text("Criar novo usuário"),
                    onTap: () {
                      Navigator.of(context).pushNamed("/create-account");
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
    );
  }
}
