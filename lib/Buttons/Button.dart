import 'package:flutter/material.dart';

class OriginalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const OriginalButton(
      {key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.textColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: color,
      ),
    );
  }
}




















/*import 'package:flutter/material.dart';

Widget customButton(Color bgcolor, String text, Color textColor) {
  return SizedBox(
    height: 60,
    width: double.infinity,
    child: MaterialButton(
        onPressed: () {},
        color: bgcolor,
        elevation: double.maxFinite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 30),
        )),
  );
}*/

/*
class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color bgcolor;

  const Button(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.bgcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: MaterialButton(
          onPressed: onPressed,
          color: bgcolor,
          elevation: double.maxFinite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: 30),
          )),
    );
  }
}
*/
