class Endereco {
  int id;
  int userId;
  String zipCode;
  String publicPlace;
  int number;
  String neighborhood;
  String city;
  String uf;
  String country;

  Endereco({
    this.id,
    this.userId,
    this.zipCode,
    this.publicPlace,
    this.number,
    this.neighborhood,
    this.city,
    this.uf,
    this.country,
  });

  Endereco.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    // userId = map['user_id'];
    publicPlace = map['public_place'];
    neighborhood = map['neighborhood'];
    city = map['city'];
    uf = map['uf'];
    country = 'Brasil';
    number = map['number'];
    zipCode = map['zip_code'];
  }

  Endereco.fromCep(Map<String, dynamic> map) {
    publicPlace = map['logradouro'];
    neighborhood = map['bairro'];
    city = map['localidade'];
    uf = map['uf'];
    country = 'Brasil';
  }

  Map<String, dynamic> toMap() {
    return {
      'public_place': publicPlace,
      'neighborhood': neighborhood,
      'city': city,
      'uf': uf,
      'country': country,
      'zip_code': zipCode,
      'number': number,
    };
  }
}
