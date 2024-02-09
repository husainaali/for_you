import 'dart:developer';

import 'package:file_picker/file_picker.dart';

class MultiPartRequest {
  String key;
  FilePickerResult file;

  MultiPartRequest(this.key, this.file);
}

