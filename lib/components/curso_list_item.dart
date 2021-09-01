import 'package:flutter/material.dart';
import 'package:gerenciamento_curso/models/curso.dart';
import 'package:gerenciamento_curso/providers/cursos.dart';
import 'package:gerenciamento_curso/routes/app_routes.dart';
import 'package:provider/provider.dart';

class CursoListItem extends StatelessWidget {
  final Curso curso;

  const CursoListItem(this.curso);

  @override
  Widget build(BuildContext context) {
    final Cursos cursos = Provider.of(context, listen: false);

    return ListTile(
        title: Text(curso.name),
        subtitle: Text(curso.duracao.toString() + " horas de curso"),
        trailing: Container(
          width: 50,
          child: Row(children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.CURSO_DETAILS, arguments: curso);
              },
              icon: Icon(Icons.list),
            ),
          ]),
        ));
  }
}
