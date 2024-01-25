import 'package:get/get.dart';

import '../controllers/peminjaman_list_controller.dart';

class PeminjamanListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeminjamanListController>(
      () => PeminjamanListController(),
    );
  }
}
