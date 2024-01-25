import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinjam Buku ${Get.parameters['judul'].toString()}'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.tanggalPinjamController,
                  decoration: InputDecoration(hintText: "Tanggal Pinjam"),
                  validator: (value){
                    if (value!.isEmpty){
                      return "Tanggal tidak Boleh Kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.tanggalKembaliController,
                  decoration: InputDecoration(hintText: "Tanggal Kembali"),
                  validator: (value){
                    if (value!.isEmpty){
                      return "Tanggal Tidak Boleh Kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                Obx(() => controller.loading.value?
                CircularProgressIndicator():
                ElevatedButton(onPressed: (){
                  controller.pinjam();
                },child: Text("Pinjam"))),

              ],
            ),
          )
      ),
    );
  }
}
