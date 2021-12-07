import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  Future<String> printText() {
    print("Start working func printText()");
    return Future.delayed(
        const Duration(seconds: 5), () => "This text print after 5 seconds");
  }

  void funcThen() {
    Future<String> result = printText();
    result.then((text) => print(text)).catchError((e) => print(e));
    print('Wait for print text (then)...');
  }

  Future<void> funcAwait() async {
    String result = await printText();
    print('Wait for print text(await)...');
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Column(children: <Widget>[
          Center(
            child: ElevatedButton(
              onPressed: () {
                funcThen();
              },
              child: const Text('Start by then'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                funcAwait();
              },
              child: const Text('Start by await'),
            ),
          ),
        ]));
  }
}
