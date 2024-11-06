import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_info_app/views/post_widget.dart';

import '../View_Models/post_viewmodels.dart';
import '../View_Models/user_viewmodels.dart';

class UserScreen extends StatelessWidget {
  final TextEditingController userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Watch for changes in the UserViewModel and PostViewModel
    final userViewModel = context.watch<UserViewModel>();
    final postViewModel = context.watch<PostViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // User ID input field
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(
                labelText: 'Enter User ID',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            // Button to trigger user and posts data fetch
            ElevatedButton(
              onPressed: () {
                final userId = int.tryParse(userIdController.text);
                if (userId != null) {
                  // Fetch data for the given user ID
                  userViewModel.fetchUserData(userId);
                  postViewModel.fetchUserPosts(userId);
                } else {
                  // Show error if invalid ID
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please enter a valid user ID.'),
                  ));
                }
              },
              child: Text('Fetch User Data'),
            ),
            SizedBox(height: 16),
            // Display user data if available
            userViewModel.isLoading
                ? CircularProgressIndicator() // Loading indicator while fetching user data
                : userViewModel.user != null
                ? Column(
              children: [
                Text('Name: ${userViewModel.user?.name}'),
                Text('Email: ${userViewModel.user?.email}'),
                Text('Address: ${userViewModel.user?.addressStreet}, ${userViewModel.user?.addressCity}'),
                Text('Company: ${userViewModel.user?.companyName}'),
              ],
            )
                : Text('No user found'), // Message if no user data is found
            // Display posts if available
            postViewModel.isLoading
                ? CircularProgressIndicator() // Loading indicator while fetching posts
                : Expanded(child: PostWidget()), // Display posts when loaded
          ],
        ),
      ),
    );
  }
}
