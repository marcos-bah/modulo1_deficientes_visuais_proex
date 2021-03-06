import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/about/about.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/builder/builder.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/create-account/create_account.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/edit-account/edit_account.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/home/home.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/login/login.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/maps/map.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/maps/viewMap.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/organization/organization.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/recovery-password/recovery_password.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/user.model.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<UserModel>(
      create: (_) => UserModel(),
      child: MaterialApp(
        title: 'Módulo 1',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => LoginView(),
          "/login": (context) => LoginView(),
          "/recovery-password": (context) => RecoveyPasswordView(),
          "/home": (context) => HomeView(),
          "/create-account": (context) => CreateAccountView(),
          "/edit-account": (context) => EditAccountView(),
          "/about": (context) => AboutView(),
          "/builder": (context) => BuilderView(),
          "/organization": (context) => OrganizationView(),
          "/map": (context) => MapView(),
          "/view-map": (context) =>
              ViewMapView(id: "e721a613-7ad6-4af9-b58f-651d38bf6a0c"),
        },
      ),
    );
  }
}
