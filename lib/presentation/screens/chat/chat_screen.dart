import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_flutter/domain/entities/message.dart';
import 'package:yes_no_app_flutter/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_flutter/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_flutter/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_flutter/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static const routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blte52fc588aa36c464/6533f23662bf3d37747a2df9/Cristiano_Ronaldo(1).jpg?auto=webp&format=pjpg&width=1920&quality=60"),
          ),
        ),
        title: const Text('Mi mee'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController ,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);

                    })),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
