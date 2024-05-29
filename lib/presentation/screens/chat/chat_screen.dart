import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://www.redebrasilatual.com.br/wp-content/uploads/2016/06/8c5f6bad-e9c0-4a51-b5d3-53b839ea16a1.jpeg')
          ),
        ),
        title: const Text('Mi amor 2'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index){
                return ( index % 2 == 0 )
                  ? const HerMessageBubble()
                  : const MyMessageBubble();
              },
            )),
            const Text('Mundo')
          ],
        ),
      ),
    );
  }
}