import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:somecruzki/cubit/clicker_cubit.dart';
import 'package:somecruzki/cubit/theme_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider<ClickerCubit>(
          create: (BuildContext context) => ClickerCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clicker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<ClickerCubit, ClickerState>(
              builder: (context, state) {
                if (state is Click) {
                  return Text(
                    state.count.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }

                return Text(
                  "0",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => context.read<ClickerCubit>().decrement(),
                  tooltip: 'Вычитание',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () => context.read<ClickerCubit>().increment(),
                  tooltip: 'Прибавление',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<ClickerCubit>().changeTheme();
                    context.read<ThemeCubit>().changeTheme();
                  },
                  tooltip: 'Тема',
                  child: const Icon(Icons.sunny),
                ),
                FloatingActionButton(
                  onPressed: () => context
                      .read<ClickerCubit>()
                      .DeleteAllDataInSharedPreferences(),
                  tooltip: 'Удаление шереда',
                  child: const Icon(Icons.share),
                ),
              ],
            ),
            BlocBuilder<ClickerCubit, ClickerState>(
              builder: (context, state) {
                List<Text> elements = [];
                if (state is Click) {
                  for (var log in state.logs) {
                    elements.add(Text(
                      log,
                    ));
                  }
                }

                return ListView(
                  shrinkWrap: true,
                  children: elements,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
