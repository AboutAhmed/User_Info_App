import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_info_app/View_Models/post_viewmodels.dart';
import 'package:user_info_app/View_Models/user_viewmodels.dart';

import 'package:user_info_app/views/user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => PostViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User Info App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserScreen(),
      ),
    );
  }
}
