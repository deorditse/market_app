// import 'dart:io';
// import 'package:marketplace_app/packages/ui_layout/widgets_for_all_pages/default_dialog.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
//
// Future<File?> createPhotoFromCamera({required BuildContext context}) async {
//   //проверю сначала разрешения
//
//   if (await Permission.camera.status.isDenied) {
//     await Permission.camera.request();
//     return await _pickImageFromCamera(context: context);
//   } else if (await Permission.camera.isPermanentlyDenied) {
//     //если навсегда отключена camera
//     openAppSettings();
//   } else {
//     return await _pickImageFromCamera(context: context);
//   }
//   return null;
// }
//
// Future<File?> _pickImageFromCamera({required BuildContext context}) async {
//   Navigator.pop(context);
//   final XFile? image =
//       await ImagePicker().pickImage(source: ImageSource.camera);
//
//   if (image == null) return null;
//   final File imageTemporary = File(image.path);
//   print(imageTemporary);
//   return imageTemporary;
// }
