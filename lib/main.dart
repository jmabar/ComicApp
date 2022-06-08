import 'package:flutter/material.dart';

import 'package:comic_app/business_logic/blocs/connectivity/connectivity_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/blocs/typeview/typeview_bloc.dart';
import 'data/repositories/comic_vine_repository.dart';
import 'presentation/pages/pages.dart';

void main() {
  runApp(const ComicVineApp());
}

class ComicVineApp extends StatelessWidget {
  const ComicVineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainTypeviewBloc(ComicVineRepository())),
        BlocProvider(create: (_) => ConnectivityBloc()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Comic Vine App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MainPage()),
    );
  }
}
