import 'package:formulario_cadastro/data/database.dart';
import '../entidades/usuario.dart';

class UserRepository {
  final _db = DataBase();

  Future<bool> newUser(Usuario obj) async {
    var handleDb = await _db.getDb();
    var rows = await handleDb.insert('users', obj.toMap());
    return rows > 0;
  }

  Future<bool> updateUser(Usuario obj) async {
    var handleDb = await _db.getDb();
    var rows = await handleDb
        .update('users', obj.toMap(), where: 'id = ?', whereArgs: [obj.id]);
    return rows > 0;
  }

  Future<bool> delUser(Usuario obj) async {
    print(obj);
    var handleDb = await _db.getDb();
    var rows =
        await handleDb.delete('users', where: 'id = ?', whereArgs: [obj.id]);
    return rows > 0;
  }

  Future<List<Usuario>> allUsers() async {
    var retorno = <Usuario>[];
    var handleDb = await _db.getDb();
    var rows = await handleDb.query('users');

    if (rows.isNotEmpty) {
      rows.forEach((element) => retorno.add(Usuario.fromMap(element)));
      return retorno;
    }
    return retorno;
  }
}
