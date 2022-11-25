import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Row(),
          Text('Image placeholder'),
          Text(
              'Santa was real that is til he forgot Chuck Norris\' christmas present'),
          Container(
            child: const Text('Another Random Joke'),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15))),
          )
        ]),
      ),
    );
  }
}
