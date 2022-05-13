import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({Key? key}) : super(key: key);

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: MaterialButton(
            textColor: Colors.white,
            child: const Text('PICK UP'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            color: Colors.black87,
            onPressed: pickUpFiles),
      ),
    ));
  }

  pickUpFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4'],
    );
    if (result != null) {
      print("file path : " + result.files.single.path!);
      File file = File(result.files.single.path!);
    } else {}
  }
}
