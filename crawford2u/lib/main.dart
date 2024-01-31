import 'package:crawford2u/Pages/agent/login_page.dart';
import 'package:crawford2u/Pages/agent/sign_up_page.dart';
import 'package:crawford2u/Pages/dashboard/userList.dart';
import 'package:crawford2u/Pages/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      //home: SignUpPage(),
      //home: LoginPage(),
      //home:AgentListPage(),
    );
  }
}

