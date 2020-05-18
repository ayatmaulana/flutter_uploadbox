import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class BoxField extends StatefulWidget {
  Function onTap;
  double height;
  Widget child;

  BoxField({this.onTap, this.height = 56, this.child});

  @override
  _BoxFieldState createState() => _BoxFieldState();
}

class _BoxFieldState extends State<BoxField> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: DottedBorder(
        color: Color(0xFF939699),
        // gap: 3,
        dashPattern: [3],
        borderType: BorderType.RRect,
        strokeWidth: 1,
        child: Container(
          height: widget.height,
          child: Center(child: widget.child),
        ),
      ),
    );
  }
}
