import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gerenciamento_curso/data/curso_mock_data.dart';
import 'package:gerenciamento_curso/models/curso.dart';

class Cursos with ChangeNotifier {
  final Map<String, Curso> _items = {...MOCK_DATA};

  List<Curso> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Curso byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Curso curso) {
    if (curso.id.trim().isNotEmpty && _items.containsKey(curso.id)) {
      _items.update(curso.id, (_) => curso);
    } else {
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(
          id,
          () => Curso(
              id: id,
              name: curso.name,
              descricao: curso.descricao,
              duracao: curso.duracao));
    }

    notifyListeners();
  }

  void remove(Curso curso) {
    if (curso.id.isEmpty) {
      return;
    }

    _items.remove(curso.id);

    notifyListeners();
  }
}
