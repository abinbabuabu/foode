import 'package:flutter/cupertino.dart';

class mDivider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 36,
      decoration:BoxDecoration(
        color: Color(0xFF707070),
        borderRadius: BorderRadius.circular(4)
      ),
    );
  }

}