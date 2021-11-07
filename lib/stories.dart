// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final stories = Expanded(
      child: Padding(
    padding: const EdgeInsets.only(
      top: 6.0,
    ),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => index != 0
            ? Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(children: [
                            Stack(
                              children: const [
                                CircleAvatar(
                                  radius: 36.5,
                                  backgroundColor: Colors.deepOrangeAccent,
                                  child: CircleAvatar(
                                    radius: 34,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 31,
                                      backgroundImage: NetworkImage(
                                          'https://fotogora.ru/img/blog/or/2020/10/15/17756.jpg'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Text("someUser",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12)),
                          ])))
                ],
              )
            : Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(children: [
                            Stack(
                              children: const [
                                CircleAvatar(
                                  radius: 36.5,
                                  backgroundColor: Colors.deepOrangeAccent,
                                  child: CircleAvatar(
                                    radius: 34,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 31,
                                      backgroundImage: NetworkImage(
                                          'https://i.ibb.co/tKLsbHF/100763461-2916405778395927-6507815384403682321-n.jpg'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 44,
                                    right: 5,
                                    child: CircleAvatar(
                                        radius: 11.0,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                            radius: 9,
                                            child: Icon(
                                              Icons.add,
                                              size: 14.0,
                                              color: Colors.white,
                                            ))))
                              ],
                            ),
                            const Text("Your stories",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12)),
                          ])))
                ],
              )),
  ));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [stories],
      ),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.grey, width: 0.1),
      )),
    );
  }
}
