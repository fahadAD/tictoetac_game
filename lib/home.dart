import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameHome extends StatefulWidget {
  const GameHome({super.key});

  @override
  State<GameHome> createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  bool turn = false;
  int ohScore=0;
  int exScore=0;
  int filledBoxes=0;

  List<String> display = ["", "", "", "", "", "", "", "", ""];
  void Tapped(int index) {
    setState(() {
      if (turn && display[index] == '') {
        display[index] = 'O';
        filledBoxes+=1;
      } else if(!turn && display[index] == ''){
        display[index] = 'X';
        filledBoxes+=1;
      }
      turn = !turn;
      _ChekWinner();
    });
  }

  void _ChekWinner() {
    //1st row
    if (display[0] == display[1] &&
        display[0] == display[2] &&
        display[0] != "") {
      _showDialog(display[0]);
    }
    //2nd row
    if (display[3] == display[4] &&
        display[3] == display[5] &&
        display[3] != "") {
      _showDialog(display[3]);
    }
    //3rd row
    if (display[6] == display[7] &&
        display[6] == display[8] &&
        display[6] != "") {
      _showDialog(display[6]);
    }
    //1st coloum
    if (display[0] == display[3] &&
        display[0] == display[6] &&
        display[0] != "") {
      _showDialog(display[0]);
    }
    //2nd coloum
    if (display[1] == display[4] &&
        display[1] == display[7] &&
        display[1] != "") {
      _showDialog(display[1]);
    }
    //3rd coloum
    if (display[2] == display[5] &&
        display[2] == display[8] &&
        display[2] != "") {
      _showDialog(display[2]);
    }
    //checks dialog
    if (display[6] == display[4] &&
        display[6] == display[2] &&
        display[6] != "") {
      _showDialog(display[6]);
    }
    //checks dialog
    if (display[0] == display[4] &&
        display[0] == display[8] &&
        display[0] != "") {
      _showDialog(display[0]);
    }else if(filledBoxes == 9){
      _draw_show_Dialog();
    }
  }

  void _showDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context, builder: (context) {
      return AlertDialog(

        title: Text("WINNER IS = $winner \n Congrats dear $winner"),
        content: Text("Do you want to play again!!"),
        actions: [
          TextButton(onPressed: () {
          Navigator.pop(context);
          }, child: Text("No",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),

          TextButton(onPressed: () {
            _clearBoard();
            Navigator.pop(context);
          }, child: Text("Yes",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),))

        ],
      );
    },);
    if(winner == "O"){
      ohScore += 1;
    }else if(winner == "X"){
      exScore += 1;
    }
  }
  void _draw_show_Dialog() {
    showDialog(
      barrierDismissible: false,
      context: context, builder: (context) {
      return AlertDialog(

        title: Text("DRAW"),
        actions: [
          ElevatedButton(onPressed: () {
            _clearBoard();
            Navigator.of(context).pop();
          }, child: const Text("Playagain!")),
        ],
      );
    },);

  }
  void _clearBoard(){
    setState(() {
      for(int i=0;i<9;i++){
        display[i]="";
      }
    });
    filledBoxes=0;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      floatingActionButton: FloatingActionButton(onPressed: () {
        _clearBoard();
      },child:  const Center(
        child:  Tooltip(
            message: "Restart The Play Board",
            child: Icon(Icons.restart_alt_rounded)),
      ),),
      body: Column(
        children: [
          Expanded(
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Player: O",style: GoogleFonts.pressStart2p(color: Colors.white,fontSize: 15)),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Your score is: $ohScore",style:GoogleFonts.aboreto(color: Colors.white)),
                          ),
                        ],
                      ),
SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Player: X",style: GoogleFonts.pressStart2p(color: Colors.white,fontSize: 15)),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Your score is: $exScore",style: GoogleFonts.aboreto(color: Colors.white)),
                          ),
                        ],
                      ),
                    ],
                  )
              )),

          Expanded(
            flex: 3,
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30, width: 2),
                    ),
                    child: Center(
                        child: Text(display[index],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold))),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text("TIC TAC TOE",style: GoogleFonts.pressStart2p(color: Colors.white,fontSize: 20)),
                    const SizedBox(height: 30,),
                    Text("Fahim Shahariar Fahad",style:GoogleFonts.pacifico(fontWeight: FontWeight.normal,color: Colors.white)),
                    Text("App Developer",style:GoogleFonts.aboreto(fontWeight: FontWeight.normal,color: Colors.white)),
                  ],
                ),

              )),
        ],
      ),
    );
  }
}
