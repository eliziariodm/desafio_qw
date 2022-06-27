import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/participants_controller.dart';

class ModalBottomComponent extends StatelessWidget {
  const ModalBottomComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ParticipantsController>();

    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Icon(
              Icons.maximize,
              color: Colors.purple,
              size: 40,
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                'Selecionar ingresso',
                style: TextStyle(color: Colors.purple, fontSize: 18),
              ),
            ),
          ),
          ListTile(
            title: const Text('Todos os ingressos'),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            leading: Transform.scale(
              scale: 1.4,
              child: Radio(
                activeColor: Colors.purple,
                value: '0',
                groupValue: controller.radioValue.value,
                onChanged: (value) {
                  controller.radioValue.value = value.toString();
                  controller.ticketType.value = 'Todos os ingressos';
                  controller.filterCounterTicket.value = 0;

                  Get.back();
                },
              ),
            ),
          ),
          const Divider(color: Colors.grey, thickness: 1),
          ListTile(
            title: const Text('Ingresso Meia'),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            leading: Transform.scale(
              scale: 1.4,
              child: Radio(
                activeColor: Colors.purple,
                value: '1',
                groupValue: controller.radioValue.value,
                onChanged: (value) {
                  controller.radioValue.value = value.toString();
                  controller.ticketType.value = 'Ingresso Meia';
                  controller.filterCounterTicket.value = 1;
                  Get.back();
                },
              ),
            ),
          ),
          ListTile(
            title: const Text('Gratuito'),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            leading: Transform.scale(
              scale: 1.4,
              child: Radio(
                activeColor: Colors.purple,
                value: '2',
                groupValue: controller.radioValue.value,
                onChanged: (value) {
                  controller.radioValue.value = value.toString();
                  controller.ticketType.value = 'Gratuito';
                  controller.filterCounterTicket.value = 1;

                  Get.back();
                },
              ),
            ),
          ),
          const Divider(color: Colors.grey, thickness: 1),
          ListTile(
            title: const Text('Ingresso teste'),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            leading: Transform.scale(
              scale: 1.4,
              child: Radio(
                activeColor: Colors.purple,
                value: '3',
                groupValue: controller.radioValue.value,
                onChanged: (value) {
                  controller.radioValue.value = value.toString();
                  controller.ticketType.value = 'Ingresso teste';
                  controller.filterCounterTicket.value = 1;
                  Get.back();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
