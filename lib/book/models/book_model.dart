class Book {
  int? id;
  String? title;
  String? subtitle;
  List<String?>? authors;
  String? publisher;
  String? publishedDate;
  String? thumbnail;
  int? pageCount;
  bool? isFavorite = false;

  Book(
      {this.title,
      this.subtitle,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.pageCount,
      this.thumbnail,
      this.isFavorite});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        title: json['volumeInfo']['title'],
        subtitle: json['volumeInfo']['subtitle'],
        authors: List.from(json['volumeInfo']["authors"])
            .map((e) => e.toString())
            .toList(),
        publisher: json['volumeInfo']['publisher'],
        pageCount: json['volumeInfo']['pageCount'],
        thumbnail: json['volumeInfo']['imageLinks']['thumbnail'],
        publishedDate: json['volumeInfo']['publishedDate'],
        isFavorite: false);
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'],
      subtitle: map['subtitle'],
      authors: List.from(map["authors"]).map((e) => e.toString()).toList(),
      publisher: map['publisher'],
      thumbnail: map['thumbnail'],
      pageCount: map['pageCount'],
      publishedDate: map['publishedDate'],
      isFavorite: map['isFavorite'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle ': subtitle,
      'authors': authors,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'thumbnail': thumbnail,
      'pageCount': pageCount,
      'isFavorite': isFavorite,
    };
  }
}
