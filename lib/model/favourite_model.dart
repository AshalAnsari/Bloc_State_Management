import 'package:equatable/equatable.dart';

class FavouriteModel extends Equatable {
  String? id;
  String? title;
  bool? isChecked;
  bool? isFavourite;

  FavouriteModel(
      {required this.id,
      required this.title,
      this.isChecked = false,
      this.isFavourite = false});

  FavouriteModel copyWith(
      {String? id, String? title, bool? isChecked, bool? isFavourite}) {
    return FavouriteModel(
        id: id, title: title, isChecked: isChecked, isFavourite: isFavourite);
  }

  @override
  List<Object?> get props => [id, title, isChecked, isFavourite];
}
