import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  regis() async {
    loading(true);
    if (passwordController.text.toString() == confirmController.text.toString()) {
      try {
        FocusScope.of(Get.context!).unfocus();
        formKey.currentState?.save();
        if (formKey.currentState!.validate()) {
          final response = await ApiProvider.instance().post(Endpoint.register,data:
          {
            "nama": namaController.text.toString(),
            "username": usernameController.text.toString(),
            "telp": telpController.text.toString(),
            "alamat": alamatController.text.toString(),
            "password": passwordController.text.toString(),
          });
          if (response.statusCode == 201) {
            Get.snackbar("Success", "Register Sukses! mohon Login..", backgroundColor: Colors.green);
            Get.offAllNamed(Routes.LOGIN);
          } else {
            Get.snackbar("Sorry", "Register gagal", backgroundColor: Colors.orange);
          }
        }
        loading(false);
      }on DioException catch(e) {
        loading(false);
        if (e.response != null){
          if (e.response?.data != null){
            Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
          }
        } else {
          Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
        }
      }catch (e) {loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      }
    }else{
      Get.snackbar("Error", "Konfirmasi Password Tidak Sesuai", backgroundColor: Colors.red);
      loading(false);
    }
  }
}
