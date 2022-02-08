import 'dart:convert';

class Item {
  String title;
  bool done;

  Item({required this.title, required this.done});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'done': done,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      title: map['title'] ?? '',
      done: map['done'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
