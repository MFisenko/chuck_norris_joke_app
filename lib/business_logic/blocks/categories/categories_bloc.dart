import 'package:bloc/bloc.dart';

import '../../../data/repositories/categories_repository.dart';
import 'categories_event.dart';
import 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _categoriesRepository;

  CategoriesBloc(this._categoriesRepository) : super(CategoriesLoadingState()) {
    on<LoadCategoriesEvent>((event, emit) async {
      emit(CategoriesLoadingState());
      try {
        final categories = await _categoriesRepository.getCategoriesData();
        emit(CategoriesLoadedState(categories));
      } catch (e) {
        emit(CategoriesFailState(error: e.toString()));
      }
    });
  }
}
