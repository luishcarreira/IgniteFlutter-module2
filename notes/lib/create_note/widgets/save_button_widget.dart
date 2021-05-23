import 'package:flutter/material.dart';

class SaveButtonWidget extends StatelessWidget {
  final String response;
  const SaveButtonWidget({
    Key? key,
    required this.response,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context, response);
      },
      child: Text('Salvar'),
    );
  }
}
