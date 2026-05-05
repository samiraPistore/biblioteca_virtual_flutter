class Book{
  final String id;
  final String title;
  final String author;
  final String descripition;
  final String image;
  final bool isFavorite;
  final String genre;


  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.descripition,
    required this.image,
    this.isFavorite = false,
    required this.genre,
  });


  //Converter Json da api para objeto

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
      id: json['id'].toString(),
      title: json['title'],
      author: json['auhor'], 
      descripition: json['descripition'], 
      image: json['image'], 
      genre: json['genre']
    );
  }
}