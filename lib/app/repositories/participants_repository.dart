import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/participants_model.dart';

class ParticipantsRepository {
  Future<List<ParticipantsModel>> fetchParticipants() async {
    String jsonString =
        await rootBundle.loadString('assets/jsons/participants.json');
    List list = jsonDecode(jsonString);
    return list.map((json) => ParticipantsModel.fromMap(json)).toList();
  }
}
