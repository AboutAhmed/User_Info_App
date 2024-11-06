import 'package:flutter/foundation.dart';
import 'package:user_info_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserViewModel extends ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _errorMessage;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUserData(int userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'));
      if (response.statusCode == 200) {
        _user = UserModel.fromJson(jsonDecode(response.body));
      } else {
        _errorMessage = 'Failed to load user data';
      }
    } catch (e) {
      _errorMessage = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
