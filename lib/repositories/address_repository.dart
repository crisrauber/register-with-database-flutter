import 'package:formulario_cadastro/data/database.dart';
import '../entidades/endereco.dart';

class AdressRepository {
  final _db = DataBase();

  Future<bool> newAdress(Endereco obj) async {
    var handleDb = await _db.getDb();
    var lastInsert =
        await handleDb.rawQuery(' select last_insert_rowid() as userId');

    var insertAdress = {
      'user_id': lastInsert[0]['userId'],
      'public_place': obj.publicPlace,
      'neighborhood': obj.neighborhood,
      'city': obj.city,
      'uf': obj.uf,
      'country': obj.country,
      'zip_code': obj.zipCode,
      'number': obj.number,
    };

    var rows = await handleDb.insert('user_addresses', insertAdress);

    return rows > 0;
    //handleDb.rawInsert(sql)
    // return rows > 0;
  }

  Future<bool> updateAddress(Endereco obj) async {
    var handleDb = await _db.getDb();
    var rows = await handleDb.update('user_addresses', obj.toMap(),
        where: 'id = ?', whereArgs: [obj.id]);
    return rows > 0;
  }

  Future<List<Endereco>> allAdress() async {
    var retorno = <Endereco>[];
    var handleDb = await _db.getDb();
    var rows = await handleDb.query('user_addresses');

    if (rows.isNotEmpty) {
      rows.forEach((element) => retorno.add(Endereco.fromMap(element)));
      return retorno;
    }
    return retorno;
  }

  Future<List<Endereco>> getAdress(int id) async {
    var retorno = <Endereco>[];
    var handleDb = await _db.getDb();
    var rows = await handleDb
        .query('user_addresses', where: 'where id = ?', whereArgs: [id]);
    if (rows.isNotEmpty) {
      rows.forEach((element) => retorno.add(Endereco.fromMap(element)));
      return retorno;
    }
    return retorno;
  }

  Future<List<Endereco>> getBy({String column, int value}) async {
    var retorno = <Endereco>[];
    var handleDb = await _db.getDb();
    var rows = await handleDb
        .query('user_addresses', where: '$column = ?', whereArgs: [value]);
    // print(rows);
    if (rows.isNotEmpty) {
      rows.forEach((element) => retorno.add(Endereco.fromMap(element)));
    }
    return retorno;
  }

  Future<bool> delAll() async {
    var handleDb = await _db.getDb();
    var rows = await handleDb.delete('user_addresses');
    return rows > 0;
  }
}
