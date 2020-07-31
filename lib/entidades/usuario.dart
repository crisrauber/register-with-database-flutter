import 'package:flutter/cupertino.dart';
import 'package:formulario_cadastro/entidades/endereco.dart';

import 'endereco.dart';

class Usuario {
  int id;
  String name;
  String email;
  String cpf;
  Endereco endereco;

  Usuario({this.name, this.email, this.cpf});

  Usuario.fromMap(Map<String, dynamic> obj) {
    name = obj['name'];
    email = obj['email'];
    cpf = obj['cpf'];
    if (obj.containsKey('public_place')) {
      endereco = Endereco.fromMap(obj);
    }
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'cpf': cpf};
  }
}
