import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_state_management/bloc/favourite/favourite_event.dart';
import 'package:flutter_bloc_state_management/bloc/favourite/favourite_state.dart';
import 'package:flutter_bloc_state_management/bloc/repository/favourite_repo.dart';
import 'package:flutter_bloc_state_management/model/favourite_model.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteRepo favouriteRepo;
  List<FavouriteModel> favouriteModelList = [];
  List<FavouriteModel> temp = [];

  FavouriteBloc(this.favouriteRepo) : super(FavouriteState()) {
    on<FetchFavouriteEvent>(fetchFavouriteEvent);
    on<FavouriteItem>(addOrRemoveFromFavourite);
    on<DeleteCheckedItem>(deleteCheckedItem);
  }

  void fetchFavouriteEvent(
      FetchFavouriteEvent event, Emitter<FavouriteState> emit) async {
    favouriteModelList = await favouriteRepo.fetchFavouriteModel();

    emit(state.copyWith(
        favouriteModel: List.from(favouriteModelList),
        listStatus: ListStatus.success));
  }

  void addOrRemoveFromFavourite(
      FavouriteItem event, Emitter<FavouriteState> emit) {
    final index =
        favouriteModelList.indexWhere((element) => element.id == event.item.id);

    favouriteModelList[index] = event.item;

    emit(state.copyWith(favouriteModel: List.of(favouriteModelList)));
  }

  void deleteCheckedItem(
      DeleteCheckedItem event, Emitter<FavouriteState> emit) {
    for (var item in favouriteModelList) {
      if (item.isChecked == true) {
        temp.add(item);
      }
    }

    favouriteModelList.removeWhere((item) => temp.contains(item));

    emit(state.copyWith(favouriteModel: List.from(favouriteModelList)));
  }
}
