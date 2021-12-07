import 'package:flutter/material.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({Key? key}) : super(key: key);

  @override
  _AnimationExample createState() => _AnimationExample();
}

class _AnimationExample extends State<AnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late List<Animation<double>> curves = [];

  late List<Animation<double>> sizesAnimation = [];

  late List<Animatable<Color?>> colorsAnimation = [];

  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    curves.add(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    curves.add(CurvedAnimation(parent: controller, curve: Curves.bounceIn));
    curves.add(CurvedAnimation(parent: controller, curve: Curves.easeInQuad));
    curves.add(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    sizesAnimation.add(Tween<double>(begin: 0, end: 60).animate(curves[0])
      ..addListener(() {
        setState(() {});
      }));
    sizesAnimation.add(Tween<double>(begin: 0, end: 270).animate(curves[1])
      ..addListener(() {
        setState(() {});
      }));
    sizesAnimation.add(Tween<double>(begin: 0, end: 290).animate(curves[2])
      ..addListener(() {
        setState(() {});
      }));
    sizesAnimation.add(Tween<double>(begin: 0, end: 260).animate(curves[3])
      ..addListener(() {
        setState(() {});
      }));
    sizesAnimation.add(Tween<double>(begin: 0, end: 300).animate(curves[2])
      ..addListener(() {
        setState(() {});
      }));

    opacityAnimation = Tween<double>(begin: 0.1, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    colorsAnimation.add(TweenSequence<Color?>(
      [
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.red,
            end: Colors.green,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.green,
            end: Colors.blue,
          ),
        ),
        TweenSequenceItem(
          weight: 1.0,
          tween: ColorTween(
            begin: Colors.blue,
            end: Colors.pink,
          ),
        ),
      ],
    ));
    colorsAnimation.add(TweenSequence<Color?>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.cyan,
          end: Colors.greenAccent,
        ),
      )
    ]));

    controller.forward();
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Example with animation'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ]),
        body: Center(
            child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              width: sizesAnimation[0].value,
              height: 30,
              color: colorsAnimation[0]
                  .evaluate(AlwaysStoppedAnimation(controller.value)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              width: sizesAnimation[1].value,
              height: 30,
              color: Colors.orangeAccent.withOpacity(opacityAnimation.value),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              width: sizesAnimation[2].value,
              height: 30,
              color: Colors.yellow,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              width: sizesAnimation[3].value,
              height: 30,
              color: Colors.green,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              width: sizesAnimation[4].value,
              height: 30,
              color: colorsAnimation[1]
                  .evaluate(AlwaysStoppedAnimation(controller.value)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              width: sizesAnimation[0].value,
              height: sizesAnimation[1].value,
              color: Colors.blue,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              width: sizesAnimation[4].value,
              height: 30,
              color: Colors.purpleAccent.withOpacity(opacityAnimation.value),
            ),
          ),
        ])));
  }
}
