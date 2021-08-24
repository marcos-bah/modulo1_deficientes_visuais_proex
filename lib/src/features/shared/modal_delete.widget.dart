import 'package:flutter/material.dart';
import 'user.repository.dart';

class ModalDeleteWidget extends StatelessWidget {
  final String uid;
  const ModalDeleteWidget({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Deseja realmente excluir?"),
      content: Text("Essa operação é irreversível"),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Cancelar",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Repository repository = Repository();
            repository.deleteAccount(uid).whenComplete(() {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/login", (route) => false);
            });
          },
          child: Text(
            "Excluir",
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
