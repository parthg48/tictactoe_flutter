import 'package:flutter/material.dart';
import 'package:flutter_application_1/boxes.dart';
import 'package:flutter_application_1/dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Boxes> buttonsList;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<Boxes> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;

    var gameButtons = <Boxes>[
      new Boxes(id: 1),
      new Boxes(id: 2),
      new Boxes(id: 3),
      new Boxes(id: 4),
      new Boxes(id: 5),
      new Boxes(id: 6),
      new Boxes(id: 7),
      new Boxes(id: 8),
      new Boxes(id: 9),
    ];
    return gameButtons;
  }

  void playGame(Boxes gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.bg = Colors.red;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "O";
        gb.bg = Colors.black;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => new DialogClass("Game Tied",
                  "Press the restart button to start again", resetGame));
        }
      }
    });
  }

  int checkWinner() {
    var winner = -1;
    for (var i = 1; i < 10; i = i + 3) {
      if (player1.contains(i) &&
          player1.contains(i + 1) &&
          player1.contains(i + 2)) {
        winner = 1;
      }
      if (player2.contains(i) &&
          player2.contains(i + 1) &&
          player2.contains(i + 2)) {
        winner = 2;
      }
    }
    for (var i = 1; i < 4; i++) {
      if (player1.contains(i) &&
          player1.contains(i + 3) &&
          player1.contains(i + 6)) {
        winner = 1;
      }
      if (player2.contains(i) &&
          player2.contains(i + 3) &&
          player2.contains(i + 6)) {
        winner = 2;
      }
    }
    if (player1.contains(1) && player1.contains(5) && player1.contains(9))
      winner = 1;
    if (player2.contains(1) && player2.contains(5) && player2.contains(9))
      winner = 2;
    if (player1.contains(3) && player1.contains(5) && player1.contains(7))
      winner = 1;
    if (player2.contains(3) && player2.contains(5) && player2.contains(7))
      winner = 2;

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => new DialogClass("Player 1 won",
                "Press the rest button to start again", resetGame));
      } else {
        showDialog(
            context: context,
            builder: (_) => new DialogClass("Player 2 won",
                "Press the rest button to start again", resetGame));
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
    setState(() {
      buttonsList = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "X and 0",
          ),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Expanded(
              child: new GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 9.0),
                itemCount: buttonsList.length,
                itemBuilder: (context, index) => new SizedBox(
                  width: 100.0,
                  height: 100.0,
                  // ignore: deprecated_member_use
                  child: new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    onPressed: buttonsList[index].enabled
                        ? () => playGame(buttonsList[index])
                        : null,
                    child: new Text(
                      buttonsList[index].text,
                      style: new TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    color: buttonsList[index].bg,
                    disabledColor: buttonsList[index].bg,
                  ),
                ),
              ),
            ),
            new RaisedButton(
              child: new Text(
                "Reset",
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.indigo,
              padding: const EdgeInsets.all(20.0),
              onPressed: resetGame,
            )
          ],
        ));
  }
}
