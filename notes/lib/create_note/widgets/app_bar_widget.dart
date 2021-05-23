import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final bool isEdit;
  const AppBarWidget({
    Key? key,
    required this.isEdit,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        isEdit ? 'Edit Note' : 'Create Note',
      ),
      centerTitle: true,
      actions: [
        if (isEdit)
          IconButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
            icon: Icon(Icons.delete),
          )
      ],
    );
  }
}
