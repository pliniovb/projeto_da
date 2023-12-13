import 'dart:io';

import 'package:flutter/material.dart';

class Anexo extends StatelessWidget {
  final File arquivo;
  const Anexo({super.key, required this.arquivo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 450,
          child: ClipRRect(
            child: Image.file(
              arquivo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
