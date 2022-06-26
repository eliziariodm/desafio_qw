import 'dart:convert';

class ParticipantsModel {
  final int id;
  final String name;
  final String email;
  final String ticket;
  final String locator;
  bool checked;

  ParticipantsModel({
    required this.id,
    required this.name,
    required this.email,
    required this.ticket,
    required this.locator,
    this.checked = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'ticket': ticket,
      'locator': locator,
      'checked': checked,
    };
  }

  factory ParticipantsModel.fromMap(Map<String, dynamic> map) {
    return ParticipantsModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      ticket: map['ticket'] ?? '',
      locator: map['locator'] ?? '',
      checked: map['checked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParticipantsModel.fromJson(String source) =>
      ParticipantsModel.fromMap(json.decode(source));
}
