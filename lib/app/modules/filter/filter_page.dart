import 'package:desafio_qw/app/modules/filter/components/modal_bottom_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/participants_controller.dart';
import 'components/bottom_navigation_component.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ParticipantsController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Filtrar participantes',
          style: TextStyle(color: Colors.purple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(
                          controller.checkInDone.value == false
                              ? Colors.white
                              : Colors.purple[700],
                        ),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 20)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      child: Text(
                        'Check-in realizado',
                        style: TextStyle(
                          color: controller.checkInDone.value == false
                              ? Colors.black54
                              : Colors.white,
                        ),
                      ),
                      onPressed: () {
                        controller.checkInDone.value =
                            !controller.checkInDone.value;
                        if (controller.checkInDone.value == true) {
                          controller.filterCounterCheck.value++;
                        } else {
                          controller.filterCounterCheck.value--;
                        }
                      },
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(
                          controller.checkInNotDone.value == false
                              ? Colors.white
                              : Colors.purple[700],
                        ),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 20)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      child: Text(
                        'Check-in n??o realizado',
                        style: TextStyle(
                          color: controller.checkInNotDone.value == false
                              ? Colors.black54
                              : Colors.white,
                        ),
                      ),
                      onPressed: () {
                        controller.checkInNotDone.value =
                            !controller.checkInNotDone.value;

                        if (controller.checkInNotDone.value == true) {
                          controller.filterCounterCheck.value++;
                        } else {
                          controller.filterCounterCheck.value--;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Text('Tipo ingresso:'),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const ModalBottomComponent(),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          controller.ticketType.value,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationComponent(),
    );
  }
}
