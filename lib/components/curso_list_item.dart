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
          width: 100,
          child: Row(children: <Widget>[
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
                                    cursos.remove(curso);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Sim')),
                            ],
                          ));
                },
                icon: Icon(Icons.delete),
                color: Colors.red)
          ]),
        ));
  }
}
