import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/participants_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ParticipantsController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Lista de participantes',
          style: TextStyle(color: Colors.purple),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: TextFormField(
                onChanged: ((value) {
                  controller.search(value);
                }),
                cursorColor: Colors.grey,
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  labelText: "Nome, e-mail, localizador",
                  labelStyle: const TextStyle(color: Colors.grey),
                  fillColor: Colors.grey[100],
                  filled: true,
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text(
                      '${controller.foundList.length} participantes',
                      style: TextStyle(
                        color: Colors.purple[500],
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple[50]),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 10)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Visibility(
                            visible: controller.checkInDone.value == true ||
                                controller.checkInNotDone.value == true ||
                                controller.ticketType.value ==
                                    'Ingresso Meia' ||
                                controller.ticketType.value == 'Gratuito' ||
                                controller.ticketType.value == 'Ingresso teste',
                            child: Container(
                              width: 23,
                              height: 23,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.purple[700],
                                  ),
                                  child: Text(
                                    '${controller.filterCounterCheck.value + controller.filterCounterTicket.value}',
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 3),
                        const Text(
                          "Filtrar",
                          style: TextStyle(color: Colors.purple, fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/icons/filter.png',
                          color: Colors.purple,
                        ),
                      ],
                    ),
                    onPressed: () => Get.toNamed('/filter'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.673,
                width: MediaQuery.of(context).size.width,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.foundList.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(
                          controller.foundList[index].name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.foundList[index].ticket,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              controller.foundList[index].locator,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        isThreeLine: true,
                        trailing: Visibility(
                          visible: controller.foundList[index].checked,
                          child: const Icon(Icons.check, color: Colors.green),
                        ),
                        onTap: () {
                          controller.isChecked(controller.foundList[index]
                              .checked = !controller.foundList[index].checked);
                        },
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
