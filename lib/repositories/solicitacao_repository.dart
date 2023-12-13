import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_da/database/db_firestore.dart';
import 'package:projeto_da/models/solicitacao.dart';
import 'package:projeto_da/services/auth_service.dart';

class SolicitacaoRepository extends ChangeNotifier {
  static final List<Solicitacao> _tabela = [];
  late FirebaseFirestore db;
  late AuthService auth;

  SolicitacaoRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFireStore();
    await _readSolicitacoes();
  }

  _startFireStore() {
    db = DBFirestore.get();
  }

  _readSolicitacoes() async {
    if (auth.usuario != null && _tabela.isEmpty) {
      final snapshot = await db.collection('usuarios').get();
      for (var doc in snapshot.docs) {
        Solicitacao solicitacao = SolicitacaoRepository._tabela
            .firstWhere((solicitacao) => solicitacao.data == doc.get('data'));
        _tabela.add(solicitacao);
        notifyListeners();
      }
    }
  }

  UnmodifiableListView<Solicitacao> get lista => UnmodifiableListView(_tabela);

  saveAll(List<Solicitacao> solicitacaoes) {
    solicitacaoes.forEach((solicitacao) async {
      if (!_tabela.any((element) => element.usuario == solicitacao.usuario)) {
        _tabela.add(solicitacao);
        await db
            .collection('usuarios/${auth.usuario!.uid}/solicitacoes')
            .doc(solicitacao.usuario)
            .set({
          'titulo': solicitacao.titulo,
          'descricao': solicitacao.descricao,
          'usuario': solicitacao.usuario,
          'data': solicitacao.data,
          'latitude': solicitacao.lat,
          'longitude': solicitacao.long,
        });
      }
    });
    notifyListeners();
  }

  remove(Solicitacao solicitacao) async {
    await db
        .collection('usuarios/${auth.usuario!.uid}/solicitacoes')
        .doc(solicitacao.usuario)
        .delete();
    _tabela.remove(solicitacao);
    notifyListeners();
  }
}
