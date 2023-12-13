import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_da/pages/solicitacoes_page.dart';
import 'package:projeto_da/widgets/anexo.dart';

class SolicitacaoPage extends StatefulWidget {
  const SolicitacaoPage({super.key});

  @override
  State<SolicitacaoPage> createState() => _SolicitacaoPageState();
}

class _SolicitacaoPageState extends State<SolicitacaoPage> {
  File? _imagem;
  String? titulo;
  String? descricao;
  final myController = TextEditingController();

  Future _tirarFoto() async {
    final captura = await ImagePicker().pickImage(source: ImageSource.camera);
    if (captura == null) return;
    setState(() {
      _imagem = File(captura.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black87),
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const Text('Nova solicitação'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black87),
              onPressed: () {
                titulo = myController.text;
              },
              child: const Center(child: Text("Cadastrar")),
            ),
          )
        ],
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Título",
                )),
            TextFormField(
                decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Descrição",
            )),
            _imagem != null
                ? Anexo(arquivo: _imagem!)
                : IconButton(
                    onPressed: () => _tirarFoto(),
                    icon: const Icon(Icons.camera_alt))
          ],
        ),
      ),
    );
  }
}
