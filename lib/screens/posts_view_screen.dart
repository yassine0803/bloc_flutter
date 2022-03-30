import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patern/blocs/post_bloc/post_bloc.dart';
import 'package:flutter_bloc_patern/models/post_model.dart';

class PostsView extends StatelessWidget {
  const PostsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("bloc"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return RefreshIndicator(
              onRefresh: ()async{
                context.read<PostBloc>().add(PullToRefreshEvent());
              },
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: ((context, index) {
                  Post post = state.posts[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(post.id.toString()),
                      ),
                      title: Text(
                        post.title,
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        post.body,
                        maxLines: 2,
                      ),
                    ),
                  );
                }),
              ),
            );
          } else if (state is FailedToLoadState) {
            return Center(
              child: Text(state.error),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
