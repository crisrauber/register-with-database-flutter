import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  Database _db;
  final int _versao = 1;
  final String _nomeDB = 'user.db';

  static DataBase _instancia = DataBase._interno();
  factory DataBase() => _instancia;
  DataBase._interno();

  Future<Database> getDb() async {
    if (_db == null) {
      var _directory = await getApplicationDocumentsDirectory();
      var _path = join(_directory.path, _nomeDB);

      _db = await openDatabase(_path, version: _versao, onCreate: _onCreate);
    }
    return _db;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      create table users (
      id integer primary key autoincrement,
      nome text not null,
      email text not null,
      cpf text not null,
      public_place text not null,
      neighborhood text not null,
      uf text not null,
      country text not null,
      city text not null,
      zip_cod text not null,
      number integer not null
     );
    ''');

    await db.execute('''
      create table user_addresses (
      id integer primary key autoincrement,
      user_id integer not null
      public_place text not null,
      neighborhood text not null,
      uf text not null,
      country text not null,
      city text not null,
      zip_cod text not null,
      number integer not null
     );
    ''');
  }
}
