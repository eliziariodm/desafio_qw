import 'package:desafio_qw/app/modules/filter/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/filter',
          page: () => FilterPage(),
        )
      ],
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.purple),
          centerTitle: true,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.purple),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
