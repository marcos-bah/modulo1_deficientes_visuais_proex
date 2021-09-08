import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';

class DropdownButtonWidget extends StatefulWidget {
  final Function onChanged;
  final String value;
  final String title;
  const DropdownButtonWidget(
      {Key? key,
      required this.onChanged,
      required this.value,
      required this.title})
      : super(key: key);

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Manrope',
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 5,
          ),
          DropdownButton(
            value: widget.value,
            hint: Text("Selecione a permissão do usuário"),
            underline: Container(
              height: 1,
              color: AppColors.primary,
            ),
            onChanged: (value) {
              widget.onChanged(value);
            },
            items: [
              DropdownMenuItem(
                child: Text("Super"),
                value: "SUPER",
              ),
              DropdownMenuItem(
                child: Text("Normal"),
                value: "NORMAL",
              ),
              DropdownMenuItem(
                child: Text("Funcionário"),
                value: "FUNC",
              )
            ],
          ),
        ],
      ),
    );
  }
}
