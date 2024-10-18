import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/image_picker/image_picker_event.dart';
import 'package:flutter_bloc_state_management/bloc/image_picker/image_picker_state.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Image Picker With Bloc"),
        ),
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
        if (state.xfile == null) {
          return InkWell(
            onTap: () {
              context.read<ImagePickerBloc>().add(CameraCapture());
            },
            child: CircleAvatar(child: Icon(Icons.camera)),
          );
        } else {
          return Image.file(File(state.xfile!.path.toString()));
        }
      }),
      // body: ,
    );
  }
}
