part of 'pizza_bloc.dart';

abstract class PizzaState extends Equatable {
  const PizzaState();

  @override
  List<Object> get props => [];
}

class PizzaInitial extends PizzaState {}

class PizzaLoaded extends PizzaState {
  final List<Pizza> pizza;
  const PizzaLoaded({required this.pizza});

  
  @override
  List<Object> get props => [pizza];
}
