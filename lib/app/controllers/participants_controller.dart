import 'package:get/get.dart';

import '../models/participants_model.dart';
import '../repositories/participants_repository.dart';

class ParticipantsController extends GetxController {
  final repository = ParticipantsRepository();

  List<ParticipantsModel> participantsList = [];

  final foundList = [].obs;
  final checked = false.obs;

  Future<List<ParticipantsModel>> getParticipants() async {
    participantsList = await repository.fetchParticipants();
    foundList.value = participantsList;

    return participantsList;
  }

  void search(String value) {
    foundList.value = participantsList
        .where((participant) =>
            participant.name.toLowerCase().contains(value) ||
            participant.email.toLowerCase().contains(value) ||
            participant.locator.toLowerCase().contains(value))
        .toList();
  }

  void isChecked(bool check) {
    participantsList.where((participant) => participant.checked);
    foundList.refresh();
  }

  @override
  void onInit() {
    getParticipants();
    super.onInit();
  }
}
