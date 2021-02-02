import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() _reiniciar;

  Resultado(this.pontuacao, this._reiniciar);

  String get texto {
    if (pontuacao < 10) {
      return 'Você não acertou muitas. Estude mais e tente uma próxima vez!';
    } else if (pontuacao <= 20) {
      return 'Você é foi bem!';
    } else if (pontuacao >= 30) {
      return 'Impressionante!! Você é muito inteligente!';
    } else {
      return 'Parabéns!! Sensacional!! Você conseguiu acertar todas as perguntas.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            texto,
            style: TextStyle(fontSize: 28),
          )
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18)
          ),
          textColor: Colors.blueAccent,
          onPressed: _reiniciar,
        ),
      ],
    );
  }
}
