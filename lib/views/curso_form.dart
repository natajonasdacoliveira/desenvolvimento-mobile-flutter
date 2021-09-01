import 'package:flutter/material.dart';
import 'package:gerenciamento_curso/models/curso.dart';
import 'package:gerenciamento_curso/providers/cursos.dart';
import 'package:provider/provider.dart';

class CursoForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Curso curso) {
    if (curso.id.isNotEmpty) {
      _formData['id'] = curso.id;
      _formData['name'] = curso.name;
      _formData['descricao'] = curso.descricao;
      _formData['duracao'] = curso.duracao.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final curso = ModalRoute.of(context)!.settings.arguments as Curso;

    _loadFormData(curso);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de curso'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();

                if (isValid) {
                  _form.currentState!.save();

                  bool edit = _formData['id'] == null;

                  String duracao = _formData['duracao'] != null
                      ? _formData['duracao']!
                      : '0';

                  Provider.of<Cursos>(context, listen: false).put(Curso(
                    id: edit ? '' : (_formData['id'])!,
                    name: (_formData['name'])!,
                    descricao: (_formData['descricao'])!,
                    duracao: int.parse(duracao),
                  ));

                  Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
              key: _form,
              child: Column(children: <Widget>[
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha o nome corretamente';
                    }
                  },
                  onSaved: (value) => _formData['name'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['descricao'],
                  decoration: InputDecoration(labelText: 'Descrição'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Preencha a descrição corretamente';
                    }
                  },
                  onSaved: (value) => _formData['descricao'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['duracao'],
                  decoration: InputDecoration(labelText: 'Duração Total'),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !(double.tryParse(value) != null)) {
                      return 'Preencha a duração corretamente';
                    }
                  },
                  onSaved: (value) => _formData['duracao'] = value!,
                ),
              ]))),
    );
  }
}
