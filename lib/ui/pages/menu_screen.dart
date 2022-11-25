import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/categories_grid.dart';
import '../widgets/search_bar.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(25, 75, 25, 0),
          child: Column(
            children: const [
              Flexible(child: Text("CHUCK NORRIS")),
              Flexible(flex: 2, child: SearchBar()),
              Flexible(flex: 1, child: Text("Or choose a category")),
              Flexible(flex: 8, child: CategoriesGrid()),
            ],
          ),
        ));
  }
}
