import 'package:flutter/cupertino.dart';

import 'Divider.dart';

class TextUnderlineWidget extends StatelessWidget {
  final String text;

  TextUnderlineWidget({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            text,
            style: TextStyle(fontFamily: "MontserratBB", fontSize: 14),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: mDivider(
            color: 0xFFFFD00A,
            height: 4,
            width: text.length * 7.2,
          ),
        )
      ],
    );
  }
}