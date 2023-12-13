import 'package:flutter/material.dart';
import 'package:projeto_da/comentario_lista.dart';
import 'package:projeto_da/models/comentario.dart';
import 'package:projeto_da/models/solicitacao.dart';
import 'package:projeto_da/pages/solicitacao_page.dart';
import 'package:projeto_da/pages/solicitacoes_page.dart';

class DetalhesPage extends StatefulWidget {
  final Solicitacao solicitacao;
  const DetalhesPage({super.key, required this.solicitacao});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  final myController = TextEditingController();
  List<ComentarioLista>? comentarios;

  adicionarCometario() async {
    comentarios?.add(Comentario(myController.text));
  }

  Future<void> abrirDialog() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            //title: const Text('Faça um comentário:'),
            children: [
              TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Faça um comentário",
                  )),
              SimpleDialog(children: [
                SimpleDialogOption(
                  child: const Text("Salvar"),
                  onPressed: () => adicionarCometario(),
                ),
                SimpleDialogOption(
                  child: const Text("Cancelar"),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetalhesPage(
                                solicitacao: widget.solicitacao,
                              ))),
                ),
              ]),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 120,
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SolicitacoesPage()),
                      );
                    },
                    child: const Icon(Icons.arrow_back)),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Text(
                          widget.solicitacao.titulo,
                          style: TextStyle(fontSize: 28, color: Colors.black87),
                        ),
                        Text(widget.solicitacao.descricao,
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87)),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Row(children: [
                    SizedBox(
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SolicitacoesPage()),
                              );
                            },
                            child: const Icon(Icons.delete)),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SolicitacaoPage()),
                              );
                            },
                            child: const Icon(Icons.edit)),
                      ),
                    )
                  ]),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              //scrollDirection: Axis.vertical,
              //shrinkWrap: true,
              itemCount: comentarios?.length,
              itemBuilder: (context, i) {
                final item = comentarios?[i];
                return ListTile(
                  subtitle: item?.criarComentario(context),
                );
              },
            ),
          ),
        ],
      ),

      //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => abrirDialog(),
        backgroundColor: Colors.blue[900],
        child: const Icon(
          Icons.comment,
          color: Colors.white,
        ),
      ),
    );
  }
}
