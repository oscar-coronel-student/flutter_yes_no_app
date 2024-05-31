import 'package:flutter/material.dart';

import 'package:yes_no_app/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier {

  List<Message> messages = [
    const Message(text: 'Hola amor!', fromWho: FromWho.me ),
    const Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];


  Future<void> sendMessage( String text ) async {
    // TODO: implementar método
  }

}