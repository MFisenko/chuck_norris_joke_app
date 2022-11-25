import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: const Icon(Icons.search, color: Colors.black),
                hintText: 'Search for a random joke',
                fillColor: Colors.grey[700]),
          ),
        ),
      ),
    );
  }
}
