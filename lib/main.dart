import 'package:firebase_core/firebase_core.dart';
import 'package:projeto_da/repositories/solicitacao_repository.dart';
import 'firebase_options.dart';
import 'package:projeto_da/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_da/meu_aplicativo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(
            create: (context) => SolicitacaoRepository(
                  auth: context.read<AuthService>(),
                ))
      ],
      child: const MeuAplicativo(),
    ),
  );
}
