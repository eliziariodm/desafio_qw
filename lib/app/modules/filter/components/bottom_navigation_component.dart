import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/participants_controller.dart';

class BottomNavigationComponent extends StatelessWidget {
  const BottomNavigationComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ParticipantsController>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(vertical: 13, horizontal: 30)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            child: const Text(
              'Limpar Filtros',
              style: TextStyle(color: Colors.black87),
            ),
            onPressed: () {
              controller.clearFilter();
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.purple[700]),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(vertical: 13, horizontal: 30)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: const Text(
              'Aplicar Filtro',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              controller.filter();
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
