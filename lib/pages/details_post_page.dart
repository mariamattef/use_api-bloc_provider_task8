import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8_use_api/bloc/comment_bloc/bloc/comment_bloc.dart';

class DetailsPostPage extends StatefulWidget {
  final int id;
  const DetailsPostPage({super.key, required this.id});

  @override
  State<DetailsPostPage> createState() => _DetailsPostPageState();
}

class _DetailsPostPageState extends State<DetailsPostPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Details Post',
            style: TextStyle(fontSize: 25),
          ),
          backgroundColor: Colors.blue,
        ),
        body: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if (state is CommentLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CommentDataState) {
              return Center(
                child: ListView.builder(
                  itemCount: state.comments.length,
                  itemBuilder: (BuildContext context, int id) {
                    return Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text(
                          ' Name: ${state.comments[id].name.toString()}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          ' Email : ${state.comments[id].email.toString()} ',
                          style:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        trailing: Text(
                            'Comment No ${state.comments[id].postId.toString()}',
                            style: const TextStyle(fontSize: 16)),
                      ),
                    ]);
                  },
                ),
              );
            }
            if (state is CommentErrorState) {
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
