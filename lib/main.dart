import 'package:flutter/material.dart';
import 'package:flutter_bloc_patern/blocs/post_bloc/post_bloc.dart';
import 'package:flutter_bloc_patern/screens/posts_view_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<PostBloc>(
        create: (context) => PostBloc()..add(LoadEvent()),
        child:const PostsView(),
      ),
    );
  }
}
