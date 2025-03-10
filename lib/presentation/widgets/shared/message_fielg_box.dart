import 'package:flutter/material.dart';

class MessageFielgBox extends StatelessWidget {
  const MessageFielgBox({super.key});

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
            onPressed: () {
              final textValue = textController.value.text;
              print('Valor de la caja de texto $textValue');
              textController.clear();
            },
            icon: const Icon(Icons.send_outlined)));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus(); //Remueve el teclado al hacer clicl fuera del input
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value $value');
        textController.clear();
        focusNode.requestFocus();
      },
      // onChanged: (value) {
      //   print('Change value: $value');
      // },
    );
  }
}
