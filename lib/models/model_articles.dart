// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:dawn_app/models/model_story.dart';

class Testing {
  List<ModelStory> mystories = [];
  Testing({
    required this.mystories,
  });

  Testing copyWith({
    List<ModelStory>? mystories,
  }) {
    return Testing(
      mystories: mystories ?? this.mystories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mystories': mystories.map((x) => x.toMap()).toList(),
    };
  }

  factory Testing.fromMap(Map<String, dynamic> map) {
    return Testing(
      mystories: List<ModelStory>.from((map['mystories'] as List<int>).map<ModelStory>((x) => ModelStory.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Testing.fromJson(String source) => Testing.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Testing(mystories: $mystories)';

  @override
  bool operator ==(covariant Testing other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.mystories, mystories);
  }

  @override
  int get hashCode => mystories.hashCode;
}
