import 'package:get/get.dart';

import '../models/participants_model.dart';
import '../repositories/participants_repository.dart';

class ParticipantsController extends GetxController {
  final repository = ParticipantsRepository();

  List<ParticipantsModel> participantsList = [];

  final foundList = [].obs;
  final checkInDone = false.obs;
  final checkInNotDone = false.obs;
  final filterCounterCheck = 0.obs;
  final filterCounterTicket = 0.obs;
  final radioValue = '0'.obs;
  final ticketType = 'Todos os ingressos'.obs;

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
    foundList.refresh();
  }

  void filter() {
    if (checkInDone.value == true && checkInNotDone.value == false) {
      foundList.value = participantsList
          .where((participant) => participant.checked == true)
          .toList();
    } else if (checkInNotDone.value == true && checkInDone.value == false) {
      foundList.value = participantsList
          .where((participant) => participant.checked == false)
          .toList();
    } else {
      foundList.value = participantsList;
    }
  }

  // void filterTicket() {
  //   if (ticketType.value == 'Ingresso Meia') {
  //     foundList.value = participantsList
  //         .where((participant) => participant.ticket.contains(ticketType.value))
  //         .toList();
  //   } else if (ticketType.value == 'Gratuito') {
  //     foundList.value = participantsList
  //         .where((participant) => participant.ticket.contains(ticketType.value))
  //         .toList();
  //   } else if (ticketType.value == 'Ingresso teste') {
  //     foundList.value = participantsList
  //         .where((participant) => participant.ticket.contains(ticketType.value))
  //         .toList();
  //   } else {
  //     foundList.value = participantsList;
  //   }
  // }

  void clearFilter() {
    checkInDone.value = false;
    checkInNotDone.value = false;
    filterCounterCheck.value = 0;
    filterCounterTicket.value = 0;
    radioValue.value = '0';
    ticketType.value = 'Todos os ingressos';
  }

  @override
  void onInit() {
    getParticipants();
    super.onInit();
  }
}
