import 'package:flutter/material.dart';

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
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(0, 2),
              color: Theme.of(context).shadowColor,
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
