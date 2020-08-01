import 'package:flutter/material.dart';
import 'package:formulario_cadastro/entidades/usuario.dart';
import 'package:formulario_cadastro/repositories/user_repository.dart';
import 'package:formulario_cadastro/utils/app_routes.dart';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  UserRepository _userRepository = UserRepository();
  List<Usuario> _allusers = [];

  @override
  void initState() {
    super.initState();
    setListUsers();
  }

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
              child: Text(
                'Menu da Aplicação',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Lista de Usuários'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(AppRoutes.USER_LIST);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Cadastro de Usuários'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(AppRoutes.REGISTER_USER);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Controle'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(AppRoutes.HOME);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title:
            Text('Lista  de usuários', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _allusers.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.gravatar.com/avatar/$index?d=robohash'),
              ),
              title: Text('${_allusers[index].name}, ${_allusers[index].cpf}'),
              subtitle: Text(_allusers[index].email),
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.REGISTER_USER,
                    arguments: _allusers[index]);
              },
            );
          },
        ),
      ),
    );
  }

  void setListUsers() async {
    _allusers =
        await _userRepository.allUsers().whenComplete(() => setState(() {}));
  }
}
