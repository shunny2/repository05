import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'De quem é a famosa frase "Penso, logo existo"?',
      'respostas': [
        {'texto': 'Platão', 'pontuacao': 0},
        {'texto': 'Galileu Galilei', 'pontuacao': 0},
        {'texto': 'Descartes', 'pontuacao': 10},
        {'texto': 'Sócrates', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Quais o menor e o maior país do mundo?',
      'respostas': [
        {'texto': 'Vaticano e Rússia', 'pontuacao': 10},
        {'texto': 'Nauru e China', 'pontuacao': 0},
        {'texto': 'Mônaco e Canadá', 'pontuacao': 0},
        {'texto': 'São Marino e Índia', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Qual o nome do presidente do Brasil que ficou conhecido como Jango?',
      'respostas': [
        {'texto': 'Jânio Quadros', 'pontuacao': 0},
        {'texto': 'Getúlio Vargas', 'pontuacao': 0},
        {'texto': 'Jacinto Anjos', 'pontuacao': 0},
        {'texto': 'João Goulart', 'pontuacao': 10},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark, 
        primaryColor: Colors.blueAccent
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas')
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciar),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
