# User Info App

A Flutter app that allows users to view detailed information about users, their posts, and comments.
The app fetches data from a public API (JSONPlaceholder) based on the user ID input.
The app follows the MVVM (Model-View-ViewModel) architecture to keep the code clean, maintainable, and scalable.

## Project Structure

lib/
├── models/
│   ├── user_model.dart      # Contains User, Address, and Company data models
│   ├── post_model.dart      # Contains Post data model
│   └── comment_model.dart  # Contains Comment data model
├── viewmodels/
│   ├── user_viewmodel.dart  # Contains UserViewModel for fetching user data
│   ├── post_viewmodel.dart  # Contains PostViewModel for fetching posts data
│   └── comment_viewmodel.dart  # Contains CommentViewModel for fetching comments data
├── views/
│   ├── user_screen.dart     # Displays the user details and posts
│   ├── post_widget.dart     # Displays the posts in a list
│   └── comment_widget.dart # Displays the comments related to each post
└── main.dart                # Entry point for the app, providing ViewModels using Provider

## MVVM Implementation

## How to Run the App

 Ensure you have Flutter installed on your machine. If not, you can download and install it from the official Flutter website: https://flutter.dev/docs/get-started/install

**Steps**:
1. Clone the repository: `git clone https://github.com/AboutAhmed/user_info_app.git` and `cd user_info_app`
2. Install dependencies: Run the following command to install the required dependencies: `flutter pub get`
3. Run the app: Make sure you have a device connected (emulator or physical device), and run: `flutter run`
4. Using the app: Open the app and input a user ID. Tap the "Fetch User Data" button to load the user details, posts, and comments. If the user ID is valid, it will display the user info, posts, and comments related to the user. If invalid, an error message will be shown.