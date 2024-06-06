import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';


class HerMessageBubble extends StatelessWidget {

  final Message _message;

  const HerMessageBubble({
    super.key,
    required Message message
  }):
    _message = message;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
            child: Text(
              _message.text,
              style: const TextStyle( color: Colors.white )
            ),
          ),
        ),
        const SizedBox(height: 5),
        ImageBubble( imageUrl: _message.imageUrl ),
        const SizedBox(height: 10),
      ],
    );
  }
}


class ImageBubble extends StatelessWidget {

  final String? imageUrl;

  const ImageBubble({
    super.key,
    this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl ?? 'https://yesno.wtf/assets/yes/10-271c872c91cd72c1e38e72d2f8eda676.gif',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: ( context, child, loadingProgress ){
          if( loadingProgress == null ) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),
            child: const Text('Mi amor está enviando una imagen'),
          );
        },
      ),
    );
  }

}