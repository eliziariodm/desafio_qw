import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({Key? key}) : super(key: key);

  Widget buildSheet() => Column(
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
                value: 0,
                groupValue: 0,
                onChanged: (value) {},
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
                value: 1,
                groupValue: 1,
                onChanged: (value) {},
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
                value: 2,
                groupValue: 2,
                onChanged: (value) {},
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
                value: 3,
                groupValue: 3,
                onChanged: (value) {},
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 25)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Check-in realizado',
                      style: TextStyle(color: Colors.black54),
                    ),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 25)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Check-in não realizado',
                      style: TextStyle(color: Colors.black54),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Text('Tipo ingresso:'),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => buildSheet(),
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
                    children: const [
                      Text(
                        'Todos os ingressos',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
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
              onPressed: () {},
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
