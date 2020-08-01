import 'package:flutter/material.dart';
import 'package:formulario_cadastro/pages/formulario_page.dart';
import 'package:formulario_cadastro/pages/home_page.dart';


class Lista extends StatefulWidget {
  static String routeName = '/lista';
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text('Menu da Aplicação',style:TextStyle(color:Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Lista de Usuários'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(Lista.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Cadastro de Usuários'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(FormularioPage.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Controle'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(HomePage.routeName);
              },
            ),
          ],
        ),
      ),
       appBar: AppBar(
        title: Text('Lista  de usuários',
        style:TextStyle(color:Colors.white)),
      ),
      body: Center(
        child:  ListView.builder(
            itemCount: 1,
              itemBuilder: (context, i){
                return ListTile(
                    title: Text("Titulo"),
                    subtitle:Text("Sub-titulo"),
                  );
                },
             ),
           ),
         );
       }
     }
