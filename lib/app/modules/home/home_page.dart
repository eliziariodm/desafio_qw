import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Lista de participantes',
          style: TextStyle(color: Colors.purple),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: TextFormField(
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
                Text(
                  '4 participantes',
                  style: TextStyle(
                    color: Colors.purple[500],
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple[50]),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    label: const Text(
                      "Filtrar",
                      style: TextStyle(color: Colors.purple, fontSize: 16),
                    ),
                    icon: Image.asset(
                      'assets/filter.png',
                      color: Colors.purple,
                    ),
                    onPressed: () => Get.toNamed('/filter'),
                  ),
                ),
              ],
            ),
          ),
          // ListView.builder(
          //   itemCount: ,
          //   itemBuilder: ((context, index) {
          //     return Container();
          //   }),
          // ),
        ],
      ),
    );
  }
}
