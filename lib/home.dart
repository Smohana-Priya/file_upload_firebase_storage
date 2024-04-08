import 'dart:io';
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
  UploadTask? uploadTask;
  List<String> fileUrls = [];

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    /// Create a storage reference from our app
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    /// get the download url from the uploaded file and add it to the list
    final snapshot = await uploadTask!.whenComplete(() {});
    final url = await snapshot.ref.getDownloadURL();
    setState(() {
      fileUrls.add(url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(child: Text('File Uploading - Firebase')),
        ),
        body: ListView.builder(
          itemCount: fileUrls.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: CircleAvatar(child: Image.network(fileUrls[index])),
                  title: Text(
                    pickedFile!.name,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: selectFile,
          child: const Icon(Icons.upload),
        ),
      ),
    );
  }
}
