import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/peminjaman_list_controller.dart';

class PeminjamanListView extends GetView<PeminjamanListController> {
  const PeminjamanListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanListView'),
        centerTitle: true,
      ),
      body: controller.obx((state) => ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text('${state[index].book?.judul}'),
              subtitle: Text('Pinjam: ${state[index].tanggalPinjam} \nKembali: ${state[index].tanggalKembali}'),
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
          itemCount: state!.length
      )),
    );
  }
}
