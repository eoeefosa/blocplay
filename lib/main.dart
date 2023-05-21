import 'dart:math';

import 'package:blocplay/bloc/pizza_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/pizza_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PizzaBloc()..add(LoadPizzaCounter()),
        )
      ],
      child: const MaterialApp(
        title: 'The Pizza Bloc',
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The pizza Bloc'),
        centerTitle: true,
        backgroundColor: Colors.orange[800],
      ),
      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            int text = state.props.length;
            if (state is PizzaInitial) {
              return const CircularProgressIndicator();
            }
            if (state is PizzaLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // '${state.Pizza.length}',
                    '$text',
                    style: const TextStyle(
                        fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (int index = 0; index < state.pizza.length; index++)
                          Positioned(
                              left: Random().nextInt(250).toDouble(),
                              top: Random().nextInt(400).toDouble(),
                              child: SizedBox(
                                height: 150,
                                width: 150,
                                child: state.pizza[index].image,
                              ))
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read().add(AddPizza(Pizza.pizza[0]));
            },
            child: const Icon(Icons.local_pizza_outlined),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read().add(RemovePizza(Pizza.pizza[0]));
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read().add(AddPizza(Pizza.pizza[1]));
            },
            child: const Icon(Icons.local_pizza),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.orange[800],
            onPressed: () {
              context.read().add(RemovePizza(Pizza.pizza[1]));
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
