import 'package:flutter_bloc_state_management/model/favourite_model.dart';

class FavouriteRepo {
  int id = 0;
  Future<List<FavouriteModel>> fetchFavouriteModel() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavouriteModel> _generateList(int lenght) {
    return List.generate(
      lenght,
      (index) => FavouriteModel(
          id: (id = id + 1).toString(), title: "Task ${index + 1}"),
    );
  }
}
