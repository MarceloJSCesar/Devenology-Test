import 'package:flutter/material.dart';

class DetailsBottomButton extends StatelessWidget {
  final String assetImg;
  final Color color;
  final String label;
  final Function onTap;
  final TextStyle textStyle;
  const DetailsBottomButton({
    Key? key,
    required this.color,
    required this.label,
    required this.onTap,
    required this.assetImg,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 140,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              label,
              style: textStyle,
            ),
            GestureDetector(
              child: Image(
                image: AssetImage(assetImg),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
