import 'package:flutter/material.dart';
import 'package:projeto_da/widgets/auth_check.dart';
//import 'package:projeto_da/main.dart';

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "projetoDA",
      debugShowCheckedModeBanner: false,
      home: AuthCheck(),
    );
  }
}
