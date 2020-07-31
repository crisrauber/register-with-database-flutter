// import 'package:formulario_cadastro/data/database.dart';
// import '../entidades/endereco.dart';

// class UserRepository {
//   final _db = DataBase();

//   Future<bool> newUser(Endereco obj) async {
//     var handleDb = await _db.getDb();
//     var rows = await handleDb.insert('users', obj.toMap());
//     return rows > 0;
//   }

//   Future<bool> updateUser(Endereco obj) async {
//     var handleDb = await _db.getDb();
//     var rows = await handleDb
//         .update('users', obj.toMap(), where: 'id = ?', whereArgs: [obj.id]);
//     return rows > 0;
//   }

//   Future<bool> delUser(Endereco obj) async {
//     print(obj);
//     var handleDb = await _db.getDb();
//     var rows =
//         await handleDb.delete('users', where: 'id = ?', whereArgs: [obj.id]);
//     return rows > 0;
//   }

//   Future<List<Endereco>> allUsers() async {
//     var retorno = <Endereco>[];
//     var handleDb = await _db.getDb();
//     var rows = await handleDb.query('users');

//     if (rows.isNotEmpty) {
//       rows.forEach((element) => retorno.add(Endereco.fromMap(element)));
//       return retorno;
//     }
//     return retorno;
//   }
// }
