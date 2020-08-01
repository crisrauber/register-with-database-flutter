import 'package:flutter/material.dart';
import '../entidades/endereco.dart';
import '../entidades/usuario.dart';
import '../repositories/user_repository.dart';
import '../repositories/address_repository.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/control';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserRepository _userRepository = UserRepository();
  AdressRepository _adressRepository = AdressRepository();

  List<Usuario> _allusers = [];
  List<Endereco> _alladress = [];

  Usuario _usuario;
  Endereco _endereco;

  void registerUser() async {
    await _userRepository.newUser(_usuario);
  }

  void getUser(_userById) async {
    _allusers = await _userRepository.getUser(_userById);
  }

  void getUserBy(String column, String value) async {
    _allusers = await _userRepository.getBy(column, value);
  }

  void setListUsers() async {
    _allusers =
        await _userRepository.allUsers().whenComplete(() => setState(() {}));
  }

  void getAdress(_adressById) async {
    _allusers = await _userRepository.getUser(_adressById);
  }

  void setListAdress() async {
    _alladress = await _adressRepository.allAdress();
    setState(() {});
  }

  void registerAdress() async {
    await _adressRepository.newAdress(_endereco);
    setState(() {});
  }

  void clearDb() async {
    await _userRepository.delAll();
    await _adressRepository.delAll();
    setListUsers();
    setListAdress();
    setState(() {});
  }

  void add() {
    _usuario = Usuario(name: 'M2', email: 'wwww', cpf: 'eeeeee');
    _endereco = Endereco(
        zipCode: '1',
        publicPlace: 'ddddd',
        number: 33333,
        neighborhood: 'sdqdd',
        city: 'acde',
        uf: 'cdwev',
        country: 'dcwwcw');
    registerUser();
    registerAdress();
    _usuario = Usuario(name: 'M3', email: 'wwww', cpf: 'eeeeee');
    _endereco = Endereco(
        zipCode: '4',
        publicPlace: 'ddddd',
        number: 33333,
        neighborhood: 'sdqdd',
        city: 'acde',
        uf: 'cdwev',
        country: 'dcwwcw');
    registerUser();
    registerAdress();
    setListUsers();
    setListAdress();
  }

  void show() {
    setState(() {});
    setListUsers();
    setListAdress();
    print('usuario: ${_allusers.length}');
    print('endereços: ${_alladress.length}');
    print(_allusers[0].id);
    print(_alladress[0].neighborhood);

    _allusers.forEach((element) {
      print(element.id);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        backgroundColor: Color(0xFF151026),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: RaisedButton(
                    onPressed: () => clearDb(),
                    child: Text('Limpar'),
                  ),
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () => add(),
                    child: Text('cadastrar'),
                  ),
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () => show(),
                    child: Text('Mostra'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
