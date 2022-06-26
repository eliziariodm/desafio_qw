import 'package:get/get.dart';

import '../controllers/participants_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParticipantsController>(
      () => ParticipantsController(),
      fenix: true,
    );
  }
}
