import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:trend/screens/chat/widgets/message_card.dart';
import 'package:trend/theme/app_colors.dart';

class MessagesPage extends StatelessWidget {
  final List<String> messages = [
    'hi',
    'how are u today',
    'jdakjwoeiewnqfdakjoiefdnafdifh.',
    'dasionme darrta adnimlfglovdasli\ndasiofdsafadfadfnme darrta adnimlfglovdasli\ndasionme darrta adnimlfglovdasli',
    'hi',
    'how are u today',
    'jdakjwoeiewnqfdakjoiefdnafdifh.',
    'dasionme darrta adnimlfglovdasli',
    'hi',
    'how are u today',
    'jdakjwoeiewnqfdakjoiefdnafdifh.',
    'dasionme darrta adnimlfglovdasli',
  ];

  static const route = 'messages';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.iconDarkColor),
        title: Text(
          'Messages',
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              reverse: false,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return index % 2 == 0
                    ? Container(
                        alignment: Alignment.centerLeft,
                        child: MessagesCard(
                          backgroundColor: Colors.white,
                          shadow: Colors.black.withOpacity(0.1),
                          text: messages[index],
                          textColor: Colors.black,
                        ),
                      )
                    : Container(
                        alignment: Alignment.centerRight,
                        child: MessagesCard(
                          backgroundColor:
                              AppColors.sendMessageColor.withOpacity(0.8),
                          shadow: AppColors.sendMessageColor.withOpacity(0.2),
                          text: messages[index],
                          textColor: Colors.white,
                        ),
                      );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 50.00,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.00),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        offset: Offset(5, 5),
                        spreadRadius: 1,
                        blurRadius: 25),
                  ],
                ),
                child: Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Feather.image,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onSubmitted: (val) {
                            messages.add(val);
                          },
                          toolbarOptions: ToolbarOptions(
                              copy: true,
                              paste: true,
                              cut: true,
                              selectAll: true),
                          decoration: InputDecoration(
                              hintText: 'Type some thing . . . !',
                              border: InputBorder.none),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Feather.send),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
