import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
// import 'package:yes_no_app/main.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_fielg_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/474x/3d/b9/ab/3db9ab6fec5afe7c49350fc12166ed85.jpg'),
          ),
        ),
        title: const Text('Steve Jobs'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context
        .watch<ChatProvider>(); //escuchar los cambios de estados del provider

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider
                        .messageList.length, //límite de filas a mostrar
                    itemBuilder: (context, index) {
                      //Ternario que diferencia pares de impares
                      // return (index % 2 == 0)
                      //     ? const HisMessageBubble()
                      //     : const MyMessageBubble();
                      final message = chatProvider.messageList[index];

                      return (message.fromWho == FromWho.his)
                          ? HisMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),
            MessageFielgBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
