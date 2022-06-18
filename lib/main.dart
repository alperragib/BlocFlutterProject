import 'package:bloc_flutter_app/cubit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CubitModel()),
      ],
      child: MaterialApp(
        title: 'Bloc Flutter Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Flutter Project'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CubitModel, int>(builder: (context, sayac) {
              return Text(
                sayac.toString(),
                style: TextStyle(fontSize: 48),
              );
            }),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<CubitModel>().sayacArttir();
                },
                child: Text("Sayacı Arttır")),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<CubitModel>().sayacAzalt();
                },
                child: Text("Sayacı Azalt")),
          ],
        ),
      ),
    );
  }
}
