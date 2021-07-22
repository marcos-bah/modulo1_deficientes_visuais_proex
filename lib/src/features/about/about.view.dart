import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: size.width < 320 ? size.width * 0.8 : 320,
            height: size.height - 80,
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Spacer(
                  flex: 6,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Objetivos",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                Text(
                  "Aplicação desenvolvida com fomento da PROEX, para a criação de um conjunto de ferramentas, com um aplicativo mobile final, para auxiliar deficientes visuais.",
                ),
                Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Time",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                Text(
                  "Lina - Coordenadora",
                ),
                Text(
                  "Jesús - Coodenador",
                ),
                Text(
                  "Daniel Henrique - Desenvolvedor",
                ),
                Text(
                  "Ygor - Desenvolvedo",
                ),
                Text(
                  "Marcos - Desenvolvedor",
                ),
                Text(
                  "Helena - Desenvolvedor",
                ),
                Text(
                  "Lucas - Desenvolvedor",
                ),
                Text(
                  "Rafael - Desenvolvedor",
                ),
                Spacer(
                  flex: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
