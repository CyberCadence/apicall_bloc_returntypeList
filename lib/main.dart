 

import 'package:apicall/Model/model/model.dart';
import 'package:apicall/bloc/model_bloc.dart';
import 'package:apicall/network/repo.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ModelBloc(repo: Repo()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: BlocBuilder<ModelBloc, ModelState>(
        builder: (context, state) {
          if (state is ModelInitialstate) {
            context.read<ModelBloc>().add(Loadevent());
          }
          if (state is ModelLoadingstate) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return builwidget(state.modelclass);
          }
          if (state is Errorstate) {
            return const Center(
              child: Text('ERRORSTATE'),
            );
          }
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.yellow,
          ));
        },
      )),
    );
  }
}

Widget builwidget(List<Modelclass> model) {
  return Scaffold(
    body: Center(child: ListView.builder(itemCount: model.length,
      itemBuilder: (context, index) {
      Modelclass modelclass = model[index];
      return Container(
        child: Text(modelclass.category!.name.toString()),
      );
    })),
  );
}
