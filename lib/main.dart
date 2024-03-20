import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _respSelecionada = 0;

  final _perguntas = const [
    {
      'enuciado': '1 - Qual das opções é um número primo?',
      'alternativas': ['13', '14', '10', '18'],
    },
    {
      'enuciado': '2 - Qual das opções não é um número primo?',
      'alternativas': ['13', '11', '30', '7'],
    },
    {
      'enuciado': '3 - Qual das opções é a capital da Bélgica?',
      'alternativas': [
        'Rio de Janeiro',
        'Bruxelas',
        'Santiago',
        'Buenos Aires'
      ],
    },
    {
      'enuciado': '4 - Qual das opções é a capital do Brasil?',
      'alternativas': ['Bruxelas', 'Brasília', 'Berlim', 'Ottwa'],
    },
  ];

  bool get temRespostaSelecionada {
    return _respSelecionada < _perguntas.length;
  }

  void _responder() {
    if (temRespostaSelecionada) {
      setState(() {
        _respSelecionada++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temRespostaSelecionada
        ? _perguntas[_respSelecionada].cast()['alternativas']
        : [];

    List<Widget> widgets =
        respostas.map((texo) => Resposta(texo, _responder)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TÍTULO DO APP'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        body: temRespostaSelecionada
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_respSelecionada]['enuciado'].toString()),
                  ...widgets,
                ],
              )
            : const Center(
                child: Text(
                  "Parabéeeenss!!",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
      ),
    );
  }
}
