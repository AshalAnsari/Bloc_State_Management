import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/favourite/favourite_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/favourite/favourite_event.dart';
import 'package:flutter_bloc_state_management/bloc/favourite/favourite_state.dart';
import 'package:flutter_bloc_state_management/model/favourite_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteEvent());
  }

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Favourite App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              return Visibility(
                visible:
                    state.favouriteModel.any((item) => item.isChecked == true),
                child: IconButton(
                  onPressed: () {
                    context.read<FavouriteBloc>().add(DeleteCheckedItem(
                        toDeleteList: state.favouriteModel
                            .where((item) => item.isChecked!)
                            .toList()));
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        child: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return Center(child: CircularProgressIndicator());
              case ListStatus.failure:
                return Text(
                  "Failure",
                  style: TextStyle(color: Colors.white),
                );
              case ListStatus.success:
                return ListView.builder(
                    itemCount: state.favouriteModel.length,
                    itemBuilder: (context, index) {
                      final item = state.favouriteModel[index];

                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            leading: Checkbox(
                                value: item.isChecked,
                                onChanged: (val) {
                                  FavouriteModel favouriteItemModel =
                                      FavouriteModel(
                                          id: item.id,
                                          title: item.title,
                                          isFavourite: item.isFavourite,
                                          isChecked:
                                              item.isChecked! ? false : true);
                                  context.read<FavouriteBloc>().add(
                                      FavouriteItem(item: favouriteItemModel));
                                }),
                            title: Text(
                              "Id: ${item.id}",
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              "Title: ${item.title}",
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                FavouriteModel favouriteItemModel =
                                    FavouriteModel(
                                        id: item.id,
                                        title: item.title,
                                        isFavourite:
                                            item.isFavourite! ? false : true,
                                        isChecked: item.isChecked);
                                context.read<FavouriteBloc>().add(
                                    FavouriteItem(item: favouriteItemModel));
                              },
                              icon: Icon(item.isFavourite!
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                              color:
                                  item.isFavourite! ? Colors.red : Colors.white,
                            ),
                          ),
                        ),
                      );
                    });
            }
          },
        ),
      ),
    );
  }
}
