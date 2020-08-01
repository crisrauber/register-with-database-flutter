import 'package:flutter/material.dart';
import 'package:formulario_cadastro/utils/app_routes.dart';
import 'pages/formulario_page.dart';
import 'pages/lista_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home page',
      initialRoute: AppRoutes.USER_LIST,
      routes: {
        AppRoutes.REGISTER_USER: (context) => FormularioPage(),
        AppRoutes.USER_LIST: (context) => Lista(),
        AppRoutes.HOME: (context) => HomePage(),
      },
    );
  }
}
