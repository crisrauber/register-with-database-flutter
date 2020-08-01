 import 'package:formulario_cadastro/data/database.dart';
 import '../entidades/endereco.dart';

 class AdressRepository {
   final _db = DataBase();

   Future<bool> newAdress(Endereco obj) async {
       
    var  insertAdress = {
      'user_id' : 'last_insert_rowid()',
      'public_place': obj.publicPlace,
      'neighborhood': obj.neighborhood,
      'city': obj.city,
      'uf': obj.uf,
      'country': obj.country,
      'zip_code': obj.zipCode,
      'number': obj.number,
    };
     
    var handleDb = await _db.getDb();
     var rows = await handleDb.insert('user_addresses', insertAdress);
    
    return  rows > 0; 
    //handleDb.rawInsert(sql)
    // return rows > 0;
   
   }

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
    var rows = await handleDb.query('user_addresses',where:'where id = ?',whereArgs:[id]);
     if (rows.isNotEmpty) {
      rows.forEach((element) => retorno.add(Endereco.fromMap(element)));
      return retorno;
    }
    return retorno;
  }

  Future<List<Endereco>> getBy({String colunm, String value}) async {
    var retorno = <Endereco>[];
    var handleDb = await _db.getDb();
    var rows = await handleDb.query('user_addresses',where:'$colunm = ?',whereArgs:[value]);
     if (rows.isNotEmpty) {
      rows.forEach((element) => retorno.add(Endereco.fromMap(element)));
      return retorno;
    }
    return retorno;
  }

 
 Future<bool> delAll() async {
    var handleDb = await _db.getDb();
    var rows = await handleDb.delete('user_addresses');
    return rows > 0;
 }
 
 
 }


