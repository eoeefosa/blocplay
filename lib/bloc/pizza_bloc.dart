import 'package:bloc/bloc.dart';
import 'package:blocplay/model/pizza_model.dart';
import 'package:equatable/equatable.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaInitial()) {
    on<LoadPizzaCounter>(
      (event, emit) async {
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(const PizzaLoaded(pizza: <Pizza>[]));
      },
    );
    on<AddPizza>(
      (event, emit) async {
        if (state is PizzaLoaded) {
          final state = this.state as PizzaLoaded;
          emit(
            PizzaLoaded(
              pizza: List.from(state.pizza)..add(event.pizza),
            ),
          );
        }
      },
    );
    on<RemovePizza>(
      (event, emit) async {
        if (state is PizzaLoaded) {
          final state = this.state as PizzaLoaded;
          emit(
            PizzaLoaded(
              pizza: List.from(state.pizza)..remove(event.pizza),
            ),
          );
        }
      },
    );
  }
}
