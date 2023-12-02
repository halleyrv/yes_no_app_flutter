import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final  ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key,
    required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(30),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Escribe un mensaje',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      filled: true,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.attach_file),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
          ),
          IconButton(
            onPressed: () {
              final textValue = textController.value.text;
              print('Valor de la caja de texto? $textValue');
              textController.clear();
              onValue(textValue);
            },
            icon: const Icon(Icons.send_outlined),
          )
        ],
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value $value');
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
