import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola Steve', fromWho: FromWho.me),
    Message(text: 'Ya Regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(
        text: text,
        fromWho: FromWho.me); //En este momento el mensaje siempre vendrá de mi
    messageList.add(newMessage);

    notifyListeners();
  }
}
