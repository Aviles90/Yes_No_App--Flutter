import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola Steve', fromWho: FromWho.me),
    Message(text: 'Ya Regresaste del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(
        text: text,
        fromWho: FromWho.me); //En este momento el mensaje siempre vendrá de mi
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      hisReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> hisReply() async {
    final hisMessage = await getYesNoAnswer.getAnswer();
    messageList.add(hisMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 150));
    chatScrollController.animateTo(
        chatScrollController.position
            .maxScrollExtent, // ir al maximo scroll del Extend, es deciar hacia abajo
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
