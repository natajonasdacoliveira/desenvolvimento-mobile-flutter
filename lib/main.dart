import 'package:flutter/material.dart';
import 'package:gerenciamento_curso/providers/cursos.dart';
import 'package:gerenciamento_curso/routes/app_routes.dart';
import 'package:gerenciamento_curso/views/curso_details.dart';
import 'package:gerenciamento_curso/views/curso_list.dart';
import 'package:gerenciamento_curso/views/curso_form.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Cursos(),
        )
      ],
      child: MaterialApp(
        title: 'Gerenciamento de cursos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.CURSO_LIST: (ctx) => CursoList(),
          AppRoutes.CURSO_FORM: (ctx) => CursoForm(),
          AppRoutes.CURSO_DETAILS: (ctx) => CursoDetails(),
        },
      ),
    );
  }
}
