import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_info_app/View_Models/comment_viewmodels.dart';

class CommentWidget extends StatelessWidget {
  final int postId;

  CommentWidget({required this.postId});

  @override
  Widget build(BuildContext context) {
    // Watch for changes in the CommentViewModel
    final commentViewModel = context.watch<CommentViewModel>();

    return Column(
      children: [
        // Show loading indicator while comments are being fetched
        if (commentViewModel.isLoading)
          CircularProgressIndicator()
        else
        // Display comments once fetched
          ...commentViewModel.getComments(postId)?.map((comment) {
            return ListTile(
              title: Text(comment.name), // Comment name
              subtitle: Text(comment.body), // Comment body text
              trailing: Text(comment.email), // Commenter's email
            );
          }) ?? []
      ],
    );
  }
}
