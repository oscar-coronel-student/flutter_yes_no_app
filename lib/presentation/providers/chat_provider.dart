import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';

import 'package:yes_no_app/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    const Message(text: 'Hola amor!', fromWho: FromWho.me ),
    const Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];


  Future<void> sendMessage( String text ) async {
    if( text.isEmpty ) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if( text.trim().endsWith('?') ){
      handleHerReply();
    }

    notifyListeners();
    handleMoveScrollToBottom();
  }

  Future<void> handleHerReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
  }

  Future<void> handleMoveScrollToBottom() async {
    await Future.delayed(const Duration( milliseconds: 100 ));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration( milliseconds: 300 ),
      curve: Curves.easeOut
    );
  }

}