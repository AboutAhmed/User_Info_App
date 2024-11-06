import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_info_app/View_Models/post_viewmodels.dart';
import 'package:user_info_app/views/comment_widget.dart';

class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Watch for changes in the PostViewModel
    final postViewModel = context.watch<PostViewModel>();

    return ListView.builder(
      itemCount: postViewModel.posts.length, // Number of posts to display
      itemBuilder: (context, index) {
        final post = postViewModel.posts[index];
        return ExpansionTile(
          title: Text(post.title), // Post title as the header
          children: [
            // Display comments for the post
            CommentWidget(postId: post.id)
          ],
        );
      },
    );
  }
}
