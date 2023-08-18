import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/bloc_logic/bloc/featured_bloc.dart';
import 'package:flutter_project/bloc_logic/read_bloc.dart';
import 'package:flutter_project/page/main_page.dart';
import 'package:flutter_project/post_bloc/bloc/post_bloc.dart';
import 'package:flutter_project/rest_api/api_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PostRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PostBloc(context.read<PostRepository>())..add(PostLoadEvent()),
          ),
          BlocProvider(
            create: (context) => FeaturedBloc(),
          ),
          BlocProvider(
            create: (context) => ReadBloc(),
          ),
        ],
        child: MaterialApp(
            title: 'News App Example Test',
            theme: ThemeData(
              listTileTheme: ListTileThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(width: 1, color: Colors.grey),
                ),
              ),
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                actionsIconTheme: IconThemeData(color: Colors.black),
              ),
              textTheme: const TextTheme(
                  headlineMedium:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  titleMedium:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  bodyMedium:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
            ),
            home: const MainPage()),
      ),
    );
  }
}
