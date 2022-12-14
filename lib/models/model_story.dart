// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class ModelStory {
  String title;
  String imageURL;
  String date;
  String content;
  String articleLink;
  
  ModelStory({
    required this.title,
    required this.imageURL,
    required this.date,
    required this.content,
    required this.articleLink,
  });


  ModelStory copyWith({
    String? title,
    String? imageURL,
    String? date,
    String? content,
    String? articleLink,
  }) {
    return ModelStory(
      title: title ?? this.title,
      imageURL: imageURL ?? this.imageURL,
      date: date ?? this.date,
      content: content ?? this.content,
      articleLink: articleLink ?? this.articleLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageURL': imageURL,
      'date': date,
      'content': content,
      'articleLink': articleLink,
    };
  }

  factory ModelStory.fromMap(Map<String, dynamic> map) {
    return ModelStory(
      title: map['title'] as String,
      imageURL: map['imageURL'] as String,
      date: map['date'] as String,
      content: map['content'] as String,
      articleLink: map['articleLink'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelStory.fromJson(String source) => ModelStory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelStory(title: $title, imageURL: $imageURL, date: $date, content: $content, articleLink: $articleLink)';
  }

  @override
  bool operator ==(covariant ModelStory other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.imageURL == imageURL &&
      other.date == date &&
      other.content == content &&
      other.articleLink == articleLink;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      imageURL.hashCode ^
      date.hashCode ^
      content.hashCode ^
      articleLink.hashCode;
  }
}

