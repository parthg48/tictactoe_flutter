import 'package:flutter/material.dart';

class Computer extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback1;
  final VoidCallback callback2;
  final actionText1;
  final actionText2;

  Computer(this.title, this.content, this.callback1, this.callback2,
      [this.actionText1 = "Player 1 First",
      this.actionText2 = "Computer First"]);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text(title),
      content: new Text(content),
      actions: <Widget>[
        Row(
          children: [
            Container(
              child: new FlatButton(
                onPressed: callback1,
                color: Colors.white,
                child: new Text(actionText1),
              ),
            ),
            Container(
              child: new FlatButton(
                onPressed: callback2,
                color: Colors.white,
                child: new Text(actionText2),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
