import 'package:flutter/material.dart';
import 'package:projeto_da/comentario_lista.dart';

class Comentario implements ComentarioLista {
  final String texto;

  Comentario(this.texto);

  @override
  Widget criarComentario(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(color: Colors.black87),
    );
  }
}
