import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CategoriesEvent extends Equatable {}

class LoadCategoriesEvent extends CategoriesEvent {
  @override
  List<Object> get props => [];
}

class ChooseCategoryEvent extends CategoriesEvent {
  @override
  List<Object?> get props => throw [];
}
