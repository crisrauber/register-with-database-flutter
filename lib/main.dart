import 'package:flutter/material.dart';
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
      initialRoute: Lista.routeName,
     
      routes: {
        FormularioPage.routeName: (context) {
          return FormularioPage();
        },
        Lista.routeName: (context) {
          return Lista();
        },
        HomePage.routeName: (context) {
          return HomePage();
        },
      },
    );
  }
}