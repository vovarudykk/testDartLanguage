// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lab2/profile.dart';

// ignore: must_be_immutable
class Posts extends StatelessWidget {
  final void Function(int index) changeIsLikePressed;
  final bool Function(int index) getIsLikePressed;
  final int Function() getCountPosts;
  final int index;

  final void Function(int index, int count) changeCountSeen;
  final int Function(int index) getCountSeen;

  String get countSeenString =>
      "This photo was seen the " + getCountSeen(index).toString() + " count ";

  const Posts(this.changeIsLikePressed, this.getIsLikePressed,
      this.getCountPosts, this.index, this.getCountSeen, this.changeCountSeen);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            child: GestureDetector(
              onTap: () async {
                var newCount = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ExamplePostJson(getCountSeen(index))),
                );
                changeCountSeen(index, newCount);
              },
              child: Image.network(
                "https://i.ibb.co/nnMFXMr/19761278-259309971220648-4702378582209462272-n.jpg",
                fit: BoxFit.cover,
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(getIsLikePressed(index)
                      ? Icons.favorite
                      : FontAwesomeIcons.heart),
                  color: getIsLikePressed(index) ? Colors.red : Colors.black,
                  onPressed: () {
                    changeIsLikePressed(index);
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
            IconButton(
              icon: const Icon(FontAwesomeIcons.bookmark),
              onPressed: () {
                Navigator.pushNamed(context, '/savedfavorite',
                    arguments:
                        "https://i.ibb.co/nnMFXMr/19761278-259309971220648-4702378582209462272-n.jpg");
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 5.0,
            ),
            Text(
              countSeenString,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
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
    );
  }
}
