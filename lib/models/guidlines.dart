

class Guidlines{
  String imageUrl;
  String title;
  String description;

  Guidlines({
    this.imageUrl,
    this.title,
    this.description,
  });

  

  factory Guidlines.fromJson(Map<String, dynamic> json) {
    return Guidlines(
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description']
    );
  }



}