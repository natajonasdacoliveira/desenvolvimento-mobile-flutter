import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gerenciamento_curso/models/curso.dart';
import 'package:gerenciamento_curso/providers/cursos.dart';
import 'package:gerenciamento_curso/routes/app_routes.dart';
import 'package:provider/provider.dart';

class CursoDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cursoRecebido = ModalRoute.of(context)!.settings.arguments as Curso;
    final Cursos cursos = Provider.of(context);

    final curso = cursos.byID(cursoRecebido.id);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do curso'),
        actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.list))],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Identificador do curso: ' + curso.id,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Nome do curso: ' + curso.name,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Descrição do curso: ' + curso.descricao,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Duração do curso: ' + curso.duracao.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.CURSO_FORM, arguments: curso);
                },
                icon: Icon(Icons.edit),
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: Text('Excluir curso'),
                              content: Text('Confirmar exclusão'),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Não')),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    cursos.remove(curso);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Sim'),
                                ),
                              ],
                            ));
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red)
            ]),
          ],
        ),
      ),
    );
  }
}
