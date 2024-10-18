import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/image_picker/image_picker_event.dart';
import 'package:flutter_bloc_state_management/bloc/image_picker/image_picker_state.dart';
import 'package:flutter_bloc_state_management/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryCapture>(pickImageFromGallery);
  }

  void cameraCapture(
      CameraCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(xfile: file));
  }

  void pickImageFromGallery(
      GalleryCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.galleryCapture();
    emit(state.copyWith(xfile: file));
  }
}
