import 'package:flutter/material.dart';

import 'package:chess_game/components/piece.dart';
import 'package:chess_game/values/colors.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final bool isValidMove;
  final void Function()? onTap;
  Square({
    Key? key,
    required this.isWhite,
    this.piece,
    required this.isSelected,
    required this.onTap, 
    required this.isValidMove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? squareColor;

    //if selected, square is green 
    if(isSelected){
      squareColor = Colors.green;
    }else if(isValidMove){
      squareColor = Colors.green[300];
    }

    //othewise, it's white or black
    else{
      squareColor = isWhite ? foregroundColor : backgroundColor;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        margin: EdgeInsets.all(isValidMove ? 8 : 0),
        child: piece != null
            ? Image.asset(
                piece!.imagePath,
                color: piece!.isWhite ? Colors.white : Colors.black,
              )
            : null,
      ),
    );
  }
}
