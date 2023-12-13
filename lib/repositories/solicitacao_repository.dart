import 'package:projeto_da/models/solicitacao.dart';

class SolicitacaoRepository {
  static List<Solicitacao> tabela = [
    Solicitacao(
        titulo: "titulo1",
        descricao:
            "descricaodescricaodescricaodescricaodescricaodescricaodescricao descricao descricaodescricaodescricaodescricao",
        usuario: "usuario",
        data: "13/12/2023",
        lat: "lat",
        long: "long"),
    Solicitacao(
        titulo: "titulo2",
        descricao: "descricao2",
        usuario: "usuario2",
        data: "13/12/2023",
        lat: "lat2",
        long: "long2"),
  ];
}
