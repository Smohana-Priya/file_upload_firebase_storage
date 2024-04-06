import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PlatformFile? pickedFile;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'files/${pickedFile!.path!}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(child: Text('Firebase Stroage')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (pickedFile != null)
                Expanded(
                    child: Container(
                  color: Colors.blue[100],
                  child: Image.file(
                    File(pickedFile!.path!),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: selectFile, child: const Text('Select file')),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: uploadFile, child: const Text('Upload file')),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),

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
