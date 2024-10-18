import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_state_management/model/favourite_model.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteEvent extends FavouriteEvent {}

class FavouriteItem extends FavouriteEvent {
  final FavouriteModel item;

  FavouriteItem({required this.item});
}

class DeleteCheckedItem extends FavouriteEvent {
  final List<FavouriteModel> toDeleteList;

  DeleteCheckedItem({required this.toDeleteList});
}
