import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/favourite/favourite_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/repository/favourite_repo.dart';
import 'package:flutter_bloc_state_management/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/todo/todo_bloc.dart';
import 'package:flutter_bloc_state_management/ui/Todo/todo_screen.dart';
import 'package:flutter_bloc_state_management/ui/counter/counter_screen.dart';
import 'package:flutter_bloc_state_management/ui/favourite/favourite_screen.dart';
import 'package:flutter_bloc_state_management/ui/image_picker/image_picker_screen.dart';
import 'package:flutter_bloc_state_management/ui/switch/switch_screen.dart';
import 'package:flutter_bloc_state_management/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepo())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            appBarTheme: AppBarTheme(color: Colors.black)),
        home: FavouriteScreen(),
      ),
    );
  }
}
