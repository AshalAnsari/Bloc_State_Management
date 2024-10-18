import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState extends Equatable {
  final XFile? xfile;

  const ImagePickerState({this.xfile});

  ImagePickerState copyWith({XFile? xfile}) {
    return ImagePickerState(xfile: xfile ?? this.xfile);
  }

  @override
  List<Object?> get props => [xfile];
}
