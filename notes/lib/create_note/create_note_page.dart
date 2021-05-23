import 'package:flutter/material.dart';
import 'package:notes/create_note/widgets/app_bar_widget.dart';
import 'package:notes/create_note/widgets/save_button_widget.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  String description = "";
  var textController = TextEditingController();
  var isEdit = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = description;
        isEdit = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBarWidget(
              isEdit: isEdit,
            )),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
                maxLines: null,
                onChanged: (value) {
                  description = value;
                  setState(() {});
                },
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
              SizedBox(
                height: 32,
              ),
              if (description.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 240,
                        child: SaveButtonWidget(response: description)),
                  ],
                )
            ],
          ),
        ));
  }
}
