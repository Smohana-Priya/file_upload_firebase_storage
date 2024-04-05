// import 'dart:io';

// import 'package:file_upload_firebas_storage/service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(child: Text('Firebase Stroage')),
        ),
        body: Container(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     File? selectedImg = await getImgFromGallery(context);
        //     print('selected img $selectedImg');
        //     // if (selectedImg != null) {
        //     //   bool success = await uploadFile(selectedImg);
        //     //   print(success);
        //     // }
        //   },
        //   child: const Icon(Icons.upload),
        // ),
      ),
    );
  }
}
