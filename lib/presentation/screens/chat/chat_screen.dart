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
                "https://www.telemundo.com/sites/nbcutelemundo/files/styles/promotional_content_16_9_small/public/images/article/cover/2016/04/01/jennifer-lopez-pitbull-ama-2011.jpg"),
          ),
        ),
        title: Text('Mi mee'),
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
                      ? const HerMessageBubble()
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
