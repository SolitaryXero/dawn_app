// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WordDefinitions {
  String word;
  String urduMeaning;
  String romanMeaning;
  String definition;
  WordDefinitions({
    required this.word,
    required this.urduMeaning,
    required this.romanMeaning,
    required this.definition,
  });

  WordDefinitions copyWith({
    String? word,
    String? urduMeaning,
    String? romanMeaning,
    String? definition,
  }) {
    return WordDefinitions(
      word: word ?? this.word,
      urduMeaning: urduMeaning ?? this.urduMeaning,
      romanMeaning: romanMeaning ?? this.romanMeaning,
      definition: definition ?? this.definition,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'urduMeaning': urduMeaning,
      'romanMeaning': romanMeaning,
      'definition': definition,
    };
  }

  factory WordDefinitions.fromMap(Map<String, dynamic> map) {
    return WordDefinitions(
      word: map['word'] as String,
      urduMeaning: map['urduMeaning'] as String,
      romanMeaning: map['romanMeaning'] as String,
      definition: map['definition'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WordDefinitions.fromJson(String source) => WordDefinitions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WordDefinitions(word: $word, urduMeaning: $urduMeaning, romanMeaning: $romanMeaning, definition: $definition)';
  }

  @override
  bool operator ==(covariant WordDefinitions other) {
    if (identical(this, other)) return true;
  
    return 
      other.word == word &&
      other.urduMeaning == urduMeaning &&
      other.romanMeaning == romanMeaning &&
      other.definition == definition;
  }

  @override
  int get hashCode {
    return word.hashCode ^
      urduMeaning.hashCode ^
      romanMeaning.hashCode ^
      definition.hashCode;
  }
}
