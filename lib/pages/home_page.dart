import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8_use_api/bloc/comment_bloc/bloc/comment_bloc.dart';
import 'package:task8_use_api/bloc/post_bloc/post_bloc.dart';
import 'package:task8_use_api/pages/details_post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PostBloc>().add(LoadedPostsEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Use api and bloc provider',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoadingStete) {
              const Center(child: CircularProgressIndicator());
            }
            if (state is PostDataState) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  for (var post in state.posts) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsPostPage(
                                        id: post.id ?? 0,
                                      )));
                          context
                              .read<CommentBloc>()
                              .add((CommentLoadedEvent(id: post.id ?? 0)));
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Text(
                                state.posts[index].title.toString(),
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                state.posts[index].body.toString(),
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.grey),
                              ),
                              trailing: Text(
                                'Post No ${state.posts[index].id.toString()}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ));
                  }
                  return const Center(
                    child: Text('No data'),
                  );
                },
              );
            }
            if (state is PostErrorState) {
              Center(
                child: Text(state.errorMessage),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
