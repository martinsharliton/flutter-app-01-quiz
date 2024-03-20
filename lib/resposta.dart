import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  //const Resposta({super.key});

  final String resposta;
  final void Function() selecionarResposta;

  Resposta(this.resposta, this.selecionarResposta);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(15, 1, 15, 1),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
        ),
        onPressed: selecionarResposta,
        child: Text(resposta),
      ),
    );
  }
}
