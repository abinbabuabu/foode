import 'package:flutter/cupertino.dart';

class mDivider extends StatelessWidget{
  var color  = 0xFF707070;
  var width = 2.0;
  var height = 36.0;
  mDivider({this.color,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(4)
      ),
    );
  }

}