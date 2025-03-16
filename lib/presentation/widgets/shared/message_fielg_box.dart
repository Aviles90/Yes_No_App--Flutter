import 'package:flutter/material.dart';

class MessageFielgBox extends StatelessWidget {
  final ValueChanged<String>
      onValue; //ValiueChanged e spropio de dart para obtener un valor que cambia, en esta caso el de la caja de texto
  const MessageFielgBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    //variable para mantener el focus
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
            icon: const Icon(Icons.send_outlined),
            onPressed: () {
              final textValue = textController.value.text;
              textController.clear();
              onValue(textValue);
            }));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus(); //Remueve el teclado al hacer clicl fuera del input
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
      // onChanged: (value) {
      //   print('Change value: $value');
      // },
    );
  }
}
