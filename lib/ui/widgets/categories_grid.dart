import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telia_assignment_app/ui/main.dart';

import '../../business_logic/blocks/categories/categories_bloc.dart';
import '../../business_logic/blocks/categories/categories_event.dart';
import '../../business_logic/blocks/categories/categories_state.dart';
import '../../data/repositories/categories_repository.dart';
import '../pages/joke_screen.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesBloc(
        RepositoryProvider.of<CategoriesRepository>(context),
      )..add(LoadCategoriesEvent()),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CategoriesLoadedState) {
            List<String> categoriesList = state.categories;

            return GridView.builder(
                itemCount: categoriesList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 50,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10),
                itemBuilder: (_, index) => CategoryGridTile(
                      index: index,
                      categoriesList: categoriesList,
                    ));
          }
          return Container();
        },
      ),
    );
  }
}

class CategoryGridTile extends StatelessWidget {
  final int index;
  final List<String> categoriesList;

  const CategoryGridTile(
      {Key? key, required this.index, required this.categoriesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const JokeScreen()));
          },
          child: Container(
              child: Center(
                  child: Text(categoriesList[index].toString().capitalize())),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.40),
                        blurRadius: 2,
                        spreadRadius: 2)
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)))),
        ));
  }
}
