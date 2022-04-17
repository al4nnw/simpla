import 'package:flutter/material.dart';
import '../estilos/cores.dart';

class SimplaTextButton extends StatelessWidget {
  final Function() onPressed;

  /// Texto que estará presente no botão
  final String content;

  /// Tamanho da fonte utilizada no texto
  final double fontSize;

  /// Espaçamento interno deste botão.
  final EdgeInsets padding;

  /// Define a borda do botão.
  final double borderRadius;

  /// Cor de fundo do botão
  final Color backgroundColor;

  /// Cor do texto do botão
  final Color color;

  /// Define o peso da fonte utilizada
  final FontWeight fontWeight;

  const SimplaTextButton(
      {Key? key,
      required this.onPressed,
      required this.content,
      this.fontSize = 16,
      this.backgroundColor = branco,
      this.color = textoPreto,
      this.borderRadius = 45.0,
      this.fontWeight = FontWeight.w600,
      this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 5)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            padding: MaterialStateProperty.all(padding),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius))))),
        child: Text(content, style: TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight)));
  }
}
