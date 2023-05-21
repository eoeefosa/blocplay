import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Pizza extends Equatable {
  final String id;
  final String name;
  final Image image;

  const Pizza({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];

  static List<Pizza> pizza = [
    Pizza(
      id: '0',
      name: 'Pizza',
      image: Image.asset('images/pizza.jpeg'),
    ),
    Pizza(
      id: '1',
      name: 'Pizza pepperony',
      image: Image.asset('images/pizza_image.jpeg'),
    ),
  ];
}
