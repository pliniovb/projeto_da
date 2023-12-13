import 'package:flutter/material.dart';
import 'package:projeto_da/models/solicitacao.dart';
import 'package:projeto_da/pages/detalhes_page.dart';

class SolicitacoesCard extends StatefulWidget {
  final Solicitacao solicitacao;
  const SolicitacoesCard({super.key, required this.solicitacao});

  @override
  State<SolicitacoesCard> createState() => _SolicitacoesCardState();
}

class _SolicitacoesCardState extends State<SolicitacoesCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(top: 12),
        elevation: 2,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
            child: Row(children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.blue[800],
                ),
                child: Text(widget.solicitacao.titulo,
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                ),
                child: Text(widget.solicitacao.data,
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ]),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetalhesPage(
                      solicitacao: widget.solicitacao,
                    )),
          ),
        ));
  }
}
