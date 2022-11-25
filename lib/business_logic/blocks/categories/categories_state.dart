import 'package:equatable/equatable.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class CategoriesLoadingState extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesLoadedState extends CategoriesState {
  final List<String> categories;

  const CategoriesLoadedState(this.categories);

  @override
  List<List<String>> get props => [categories];
}

class CategoriesFailState extends CategoriesState {
  final String error;

  const CategoriesFailState({required this.error});

  @override
  List<Object> get props => [error];
}
