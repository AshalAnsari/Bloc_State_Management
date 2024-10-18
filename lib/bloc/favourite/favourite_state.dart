import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_state_management/model/favourite_model.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavouriteModel> favouriteModel;
  final ListStatus listStatus;

  FavouriteState(
      {this.favouriteModel = const [], this.listStatus = ListStatus.loading});

  FavouriteState copyWith(
      {List<FavouriteModel>? favouriteModel, ListStatus? listStatus}) {
    return FavouriteState(
        favouriteModel: favouriteModel ?? this.favouriteModel,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object?> get props => [favouriteModel, listStatus];
}
