import 'package:flutter/material.dart';
import 'package:view/customwidgets/textfields/set_text_field.dart';

class Set extends StatelessWidget {
  late int index;
  TextEditingController weightController = new TextEditingController();
  TextEditingController repsController = new TextEditingController();

  Set({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Expanded(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            (index + 1).toString(),
            style: TextStyle(fontSize: 20),
          ),
        ))),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.only(left: 48, right: 48),
              child: SetTextField(
                controller: weightController,
              )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: SetTextField(
              controller: repsController
            ),
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    ));
  }
}
