// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task8_use_api/bloc/post_bloc.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   static String id = 'HomePage';

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     context.read<PostBloc>().add(LoadedPostsEvent());
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Use api and bloc provider'),
//       ),
//       body: BlocBuilder<PostBloc, PostState>(
//         builder: (context, state) {
//           if (state is PostLoadingStete) {
//             const Center(child: CircularProgressIndicator());
//           }
//           if (state is PostDataState) {
//             return ListView.builder(
//               itemCount: state.posts.length,
//               itemBuilder: (BuildContext context, int index) {
//                 for (var post in state.posts) {
//                   return ListTile(
//                     title: Text(post.title.toString()),
//                     subtitle: Text(post.id.toString()),
//                   );
//                 }
//                 return const Center(
//                   child: Text('No data'),
//                 );
//               },
//             );
//           }
//           if (state is PostErrorState) {
//             Center(
//               child: Text(state.errorMessage),
//             );
//           }
//           return const SizedBox();
//         },
//       ),
//     );
//   }
// }


// id: post.id ?? 0
// List <PostModel> posts = [];