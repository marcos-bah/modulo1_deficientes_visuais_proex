import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/home/home.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/about/about.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/create-account/create_account.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/edit-account/edit_account.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/login/login.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/recovery-password/recovery_password.view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Módulo 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/edit-account",
      routes: {
        "/": (context) => CreateAccountView(),
        "/login": (context) => LoginView(),
        "/recovery-password": (context) => RecoveyPasswordView(),
        "/home": (context) => HomeView(),
        "/create-account": (context) => CreateAccountView(),
        "/edit-account": (context) => EditAccountView(
              id: "uid",
            ),
        "/edit-account": (context) {
          return EditAccountView();
        },
        "/about": (context) => AboutView(),
      },
    );
  }
}
