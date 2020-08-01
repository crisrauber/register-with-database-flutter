
class Usuario {
  int id;
  String name;
  String email;
  String cpf;
 
  Usuario({this.id,this.name, this.email, this.cpf});

  Usuario.fromMap(Map<String, dynamic> obj) {
    id = obj['id'];
    name = obj['name'];
    email = obj['email'];
    cpf = obj['cpf'];
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'cpf': cpf};
  }
}
