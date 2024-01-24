import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.namaController,
                  decoration: InputDecoration(hintText: "Masukan Nama Asli"),
                  validator: (value){
                    if (value!.isEmpty){
                      return "Nama tidak Boleh Kosong";
                    }
                    return null;
                  },
                ),TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(hintText: "Masukan Username"),
                  validator: (value){
                    if (value!.isEmpty){
                      return "Username tidak Boleh Kosong";
                    }
                    return null;
                  },
                ),TextFormField(
                  controller: controller.telpController,
                  decoration: InputDecoration(hintText: "Masukan No-Telp aktif"),
                  validator: (value){
                    if (value!.isEmpty){
                      return "nomer tidak Boleh Kosong";
                    }
                    return null;
                  },
                ),TextFormField(
                  controller: controller.alamatController,
                  decoration: InputDecoration(hintText: "Masukan Alamat Anda"),
                  validator: (value){
                    if (value!.isEmpty){
                      return "alamat tidak Boleh Kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(hintText: "Masukan Password"),
                  validator: (value){
                    if (value!.isEmpty){
                      return "Password Tidak Boleh Kosong";
                    }
                    return null;
                  },
                  obscureText: true,
                ),TextFormField(
                  controller: controller.confirmController,
                  decoration: InputDecoration(hintText: "Konfirmasi Password"),
                  validator: (value){
                    if (value!.isEmpty){
                      return "Konfirmasi Terlebih Dahulu";
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 50),
                Obx(() => controller.loading.value?
                CircularProgressIndicator():
                ElevatedButton(onPressed: (){
                  controller.regis();
                },child: Text("Register"))),
                SizedBox(height: 100),
                ElevatedButton(
                    onPressed: () => Get.offAllNamed(Routes.REGISTER),
                    child: Text("Login"))
              ],
            ),
          )
      ),
    );
  }
}
