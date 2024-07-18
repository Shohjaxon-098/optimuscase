import 'package:flutter/material.dart';
import 'package:optimuscase/screens/bottomBar_screen.dart';
import 'package:optimuscase/screens/case_list_screen.dart';
import 'package:optimuscase/screens/chat_list_screen.dart';
import 'package:optimuscase/screens/create_case_screen.dart';
import 'package:optimuscase/screens/notification_screen.dart';
import 'package:optimuscase/screens/post_list_screen.dart';
import 'package:optimuscase/screens/profile_screen.dart';
import 'package:optimuscase/screens/zone_screen.dart';
import 'screens/home_screen.dart'; // Import your main screen

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/home': (context) => HomeScreen(),
        '/cases': (context) => CaseListScreen(),
        '/create_case': (context) => CreateCaseScreen(),
        '/chat': (context) => ChatListScreen(),
        '/profile': (context) => ProfileScreen(),
        '/zona': (context) => ZoneScreen(),
        '/notifications': (context) =>
            NotificationsScreen(isPremiumUser: false),
        '/posts': (context) => PostListScreen(),
      },
    );
  }
}
