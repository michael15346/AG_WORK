import 'package:flutter/material.dart';

@immutable
class CustomButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  CustomButton({@required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 30,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
