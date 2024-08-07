import 'package:flutter/material.dart';
import 'package:task8_use_api/bloc/comment_bloc/bloc/comment_bloc.dart';
import 'package:task8_use_api/bloc/post_bloc/post_bloc.dart';
import 'package:task8_use_api/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8_use_api/services/get_comments.sevices.dart';
import 'package:task8_use_api/services/get_posts.services.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => PostBloc(AllPostsService()),
      ),
      BlocProvider(
        create: (context) => CommentBloc(AllCommentsService()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
