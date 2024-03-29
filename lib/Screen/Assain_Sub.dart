import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:ui_web';

// File file = File( " ");
//
// class FileUploadScreen extends StatefulWidget {
//   @override
//   _FileUploadScreenState createState() => _FileUploadScreenState();
// }
//
// class _FileUploadScreenState extends State<FileUploadScreen> {
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Upload Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.file(file),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: (){
//
//                 pickfile();
//
//               },
//
//
//               child: Text('Upload File'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void pickfile() async {
//
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//     );
//     if (result != null) {
//       setState(() {
//         file = File(result.files.single.path?? " ");
//       });
//     }
//   }
// }

class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  html.File? _selectedFile;
  Uint8List? _imageBytes;

  Future<void> _selectFile() async {
    final html.FileUploadInputElement input = html.FileUploadInputElement();
    input.accept = 'file*/'; // Restrict file types to images
    input.click();

    input.onChange.listen((event) {
      final files = input.files;
      if (files != null && files.isNotEmpty) {
        final reader = html.FileReader();
        reader.readAsArrayBuffer(files[0]);
        reader.onLoadEnd.listen((event) {
          setState(() {
            _selectedFile = files[0];
            _imageBytes = reader.result as Uint8List?;
          });
        });
      }
    });
  }

  Future<void> _uploadFile() async {
    if (_selectedFile == null) {
      // No file selected
      return;
    }

    // Create multipart request
    var url = Uri.parse('YOUR_UPLOAD_URL');
    var request = http.MultipartRequest('POST', url);

    // Add the file to be uploaded
    var multipartFile = http.MultipartFile.fromBytes(
      'file',
      _imageBytes!,
      filename: _selectedFile!.name,
    );
    request.files.add(multipartFile);

    // Send the request
    var response = await request.send();

    // Check the response status
    if (response.statusCode == 200) {
      // File uploaded successfully
      print('File uploaded');
    } else {
      // Error uploading file
      print('Error uploading file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _selectFile,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            if (_imageBytes != null)
              Image.memory(
                _imageBytes!,
                width: 200,
                height: 200,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadFile,
              child: const Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}