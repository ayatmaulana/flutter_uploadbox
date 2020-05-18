import 'package:flutter/material.dart';
import 'package:flutteruploadbox/box_field.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:async';
import 'dart:io';

class UploadBox extends StatefulWidget {
  Widget placeholder;
  Function(File) onSelected;

  UploadBox({this.onSelected, this.placeholder, Key key}) : super(key: key);

  @override
  _UploadBoxState createState() => _UploadBoxState();
}

class _UploadBoxState extends State<UploadBox> {
  File _image;

  Future selectedImage() async {
    try {
      File image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
      });

      widget.onSelected(image);
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BoxField(
        height: 120,
        onTap: selectedImage,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_image != null)
                Image.file(
                  _image,
                  width: 100,
                  height: 100,
                )
              else
                widget.placeholder
            ],
          ),
        ));
  }
}
