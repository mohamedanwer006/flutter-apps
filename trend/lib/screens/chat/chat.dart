import 'package:flutter/material.dart';
import 'package:trend/screens/chat/Messages.dart';
import 'package:trend/widgets/custome_button.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RectButton(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => MessagesPage()),
        );
      },
      text: 'Chat us',
    ));
  }
}
