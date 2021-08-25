import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseApp app = await Firebase.initializeApp();
  print('Initialized proex default app $app');
  runApp(AppWidget());
}
