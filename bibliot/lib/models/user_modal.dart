class Users{
  final String id;
  final String name;
  final String email;
  final String senha;

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.senha,

  });


  //Converter Json da api para objeto
  factory Users.fromJson(Map<String, dynamic> json){
    return Users(
      id: json['id'].toString(), 
      name: json['name'],
      email: json['email'], 
      senha:json['senha']
    );
  }
}