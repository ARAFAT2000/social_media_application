import 'package:flutter/material.dart';

class ChatPageScreen extends StatefulWidget {
  const ChatPageScreen({super.key});

  @override
  State<ChatPageScreen> createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Chat app screen'),
      ),
    );
  }
}