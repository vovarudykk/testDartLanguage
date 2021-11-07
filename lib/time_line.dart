// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lab2/stories.dart';
import 'stories.dart';

class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => index == 0
          ? SizedBox(
              child: Stories(),
              height: deviceSize.height * 0.14,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 8.0, 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://fotogora.ru/img/blog/or/2020/10/15/17756.jpg"),
                                )),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text("someUser",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      const IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Image.network(
                    "https://i.ibb.co/nnMFXMr/19761278-259309971220648-4702378582209462272-n.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(isPressed
                              ? Icons.favorite
                              : FontAwesomeIcons.heart),
                          color: isPressed ? Colors.red : Colors.black,
                          onPressed: () {
                            setState(() {
                              isPressed = !isPressed;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 3.0,
                        ),
                        const Icon(
                          FontAwesomeIcons.comment,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        const Icon(Icons.send),
                      ],
                    ),
                    const Icon(FontAwesomeIcons.bookmark),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Liked by ",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        Text(
                          "vovarudykk, teddmosbyy and 132 others",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "someUser",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Lorem ipsum bla bla bla",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://i.ibb.co/XJvtH1j/140515526-749509642355579-5642076742139118797-n.jpg")),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 14),
                            hintText: "Add a comment...",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("33 minute ago",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                )
              ],
            ),
    );
  }
}
