import 'package:flutter/material.dart';
import 'package:projeto_da/pages/solicitacao_page.dart';
import 'package:projeto_da/repositories/solicitacao_repository.dart';
import 'package:projeto_da/widgets/solicitacoes_card.dart';
//import 'package:provider/provider.dart';

class SolicitacoesPage extends StatefulWidget {
  const SolicitacoesPage({super.key});

  @override
  State<SolicitacoesPage> createState() => _SolicitacoesPageState();
}

late SolicitacaoRepository solicitacoes;

class _SolicitacoesPageState extends State<SolicitacoesPage> {
  @override
  Widget build(BuildContext context) {
    final tabela = SolicitacaoRepository.tabela;
    //solicitacoes = Provider.of<SolicitacaoRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitações Públicas'),
        backgroundColor: Colors.blue[900],
        titleTextStyle: const TextStyle(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SolicitacaoPage())),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //const Text("Ainda não há solicitações realizadas",style: TextStyle(color: Colors.black87)),
        child: tabela.isNotEmpty
            ? ListView.builder(
                itemCount: tabela.length,
                itemBuilder: (_, index) {
                  return SolicitacoesCard(solicitacao: tabela[index]);
                })
            : const Center(child: Text("Ainda não há solicitações realizadas")),
      ),
    );
  }
}
