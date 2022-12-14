
import 'dart:convert';

class ModelStory {
  String title;
  String imageURL;
  String date;
  String content;
  String articleLink;
  String imageId;
  ModelStory({
    required this.title,
    required this.imageURL,
    required this.date,
    required this.content,
    required this.articleLink,
    required this.imageId,
  });


  ModelStory copyWith({
    String? title,
    String? imageURL,
    String? date,
    String? content,
    String? articleLink,
    String? imageId,
  }) {
    return ModelStory(
      title: title ?? this.title,
      imageURL: imageURL ?? this.imageURL,
      date: date ?? this.date,
      content: content ?? this.content,
      articleLink: articleLink ?? this.articleLink,
      imageId: imageId ?? this.imageId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageURL': imageURL,
      'date': date,
      'content': content,
      'articleLink': articleLink,
      'imageId': imageId,
    };
  }

  factory ModelStory.fromMap(Map<String, dynamic> map) {
    return ModelStory(
      title: map['title'] as String,
      imageURL: map['imageURL'] as String,
      date: map['date'] as String,
      content: map['content'] as String,
      articleLink: map['articleLink'] as String,
      imageId: map['imageId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelStory.fromJson(String source) => ModelStory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelStory(title: $title, imageURL: $imageURL, date: $date, content: $content, articleLink: $articleLink, imageId: $imageId)';
  }

  @override
  bool operator ==(covariant ModelStory other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.imageURL == imageURL &&
      other.date == date &&
      other.content == content &&
      other.articleLink == articleLink &&
      other.imageId == imageId;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      imageURL.hashCode ^
      date.hashCode ^
      content.hashCode ^
      articleLink.hashCode ^
      imageId.hashCode;
  }
}

