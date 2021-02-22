import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MaterialApp(
      home: Homepage(),
    ));

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PickedFile _image;

  Future cameraImage() async {
    PickedFile image = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Container(
                    height: 300,
                    color: Colors.yellow,
                    width: 300,
                  )
                : Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: FileImage(File(_image.path)))),
                  ),
            RaisedButton(
                onPressed: () {
                  cameraImage();
                },
                child: Text('Pick Image'))
          ],
        ),
      )),
    );
  }
}
