import 'package:flutter/material.dart';


class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> _onValue;
  
  const MessageFieldBox({
    super.key,
    required ValueChanged<String> onValue
  }):
    _onValue = onValue;

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide( color: Colors.transparent ),
      borderRadius: BorderRadius.circular(20)
    );

    final inputDecoration = InputDecoration(
      hintText: 'Ingresa tu mensaje con ? al final',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: (){
          final textValue = textController.value.text;
          textController.clear();
          _onValue(textValue);
        },
        icon: const Icon( Icons.send_outlined )
      )
    );

    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        _onValue(value);
      },
    );
  }
}