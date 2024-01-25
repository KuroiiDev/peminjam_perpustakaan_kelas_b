import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookView'),
        centerTitle: true,
      ),
      body: controller.obx((state) => ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text('${state[index].judul}'),
              subtitle: Text('Penulis: ${state[index].penulis}'),
              trailing: ElevatedButton(
                child: Text("Pinjam"),
                onPressed: (){
                  Get.toNamed(Routes.PEMINJAMAN, parameters: {
                    'id': (state[index].id??0).toString(),
                    'judul' : state[index].judul ?? "-"
                  });
                },
              ),
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
