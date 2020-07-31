class Endereco {
  String zipCode;
  String publicPlace;
  int number;
  String neighborhood;
  String city;
  String uf;
  String country;

  Endereco({
    this.zipCode,
    this.publicPlace,
    this.number,
    this.neighborhood,
    this.city,
    this.uf,
    this.country,
  });

  Endereco.fromMap(Map<String, dynamic> map) {
    publicPlace = map['logradouro'];
    neighborhood = map['bairro'];
    city = map['localidade'];
    uf = map['uf'];
    country = 'Brasil';
    number = map['numero'];
    // zipCode = map['cep'];
  }

  Map<String, dynamic> toMap() {
    return {
      'pulic_place': publicPlace,
      'neighborhood': neighborhood,
      'city': city,
      'uf': uf,
      'country': country,
      'zip_code': zipCode,
      'number': number,
    };
  }
}
