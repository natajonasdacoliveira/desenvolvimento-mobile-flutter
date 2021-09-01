import 'package:flutter/material.dart';
import 'package:gerenciamento_curso/components/curso_list_item.dart';
import 'package:gerenciamento_curso/models/curso.dart';
import 'package:gerenciamento_curso/providers/cursos.dart';
import 'package:gerenciamento_curso/routes/app_routes.dart';
import 'package:provider/provider.dart';

class CursoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cursos cursos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Cursos'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.CURSO_FORM,
                  arguments:
                      Curso(id: '', name: '', descricao: '', duracao: 0));
            },
            icon: Icon(Icons.add),
            color: Colors.green,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: cursos.count,
        itemBuilder: (ctx, i) => CursoListItem(
          cursos.byIndex(i),
        ),
      ),
    );
  }
}
