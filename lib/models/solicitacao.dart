//import 'dart:io';

class Solicitacao {
  String titulo;
  String descricao;
  //File foto;
  String usuario;
  String data;
  String lat;
  String long;

  Solicitacao(
      {required this.titulo,
      required this.descricao,
      //required this.foto,
      required this.usuario,
      required this.data,
      required this.lat,
      required this.long});
}
