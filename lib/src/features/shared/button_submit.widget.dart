import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';

class ButtonSubmitWidget extends StatefulWidget {
  final String textButton;
  final Function onPressed;
  final double d;

  const ButtonSubmitWidget({
    Key? key,
    required this.textButton,
    required this.onPressed,
    this.d = 0.65,
  }) : super(key: key);
  @override
  _ButtonSubmitWidgetState createState() => _ButtonSubmitWidgetState();
}

class _ButtonSubmitWidgetState extends State<ButtonSubmitWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * widget.d,
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primary,
          shadowColor: AppColors.primary,
          elevation: 10,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
        ),
        child: Text(
          widget.textButton,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          widget.onPressed();
        },
      ),
    );
  }
}
