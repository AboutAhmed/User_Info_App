import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/comment_model.dart';

class CommentViewModel extends ChangeNotifier {
  Map<int, List<CommentModel>> commentsCache = {};
  bool isLoading = false;

  Future<void> fetchComments(int postId) async {
    if (commentsCache.containsKey(postId)) return;

    isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$postId'));

      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        commentsCache[postId] = list.map((comment) => CommentModel.fromJson(comment)).toList();
      } else {
        commentsCache[postId] = [];
      }
    } catch (e) {
      commentsCache[postId] = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<CommentModel>? getComments(int postId) {
    return commentsCache[postId];
  }
}
