import 'package:flutter/material.dart';

class StepItem extends StatefulWidget {
  final String title;
  final int index;
  const StepItem(this.title, this.index);
  @override
  _StepItemState createState() => _StepItemState();
}

class _StepItemState extends State<StepItem> {
  bool checked = false;
  void onChecked(bool value) {
    setState(() {
      checked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Text('${widget.index + 1}'),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
                decoration:
                    checked ? TextDecoration.lineThrough : TextDecoration.none),
          ),
          trailing: Checkbox(value: checked, onChanged: onChecked),
        ),
        //Linha horizontal para dividir
        Divider(),
      ],
    );
    ;
  }
}
