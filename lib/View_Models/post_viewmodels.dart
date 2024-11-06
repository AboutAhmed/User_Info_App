import 'package:flutter/foundation.dart';
import 'package:user_info_app/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostViewModel extends ChangeNotifier {
  List<PostModel> _posts = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<PostModel> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUserPosts(int userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=$userId'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        _posts = data.map((json) => PostModel.fromJson(json)).toList();
      } else {
        _errorMessage = 'Failed to load posts';
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
