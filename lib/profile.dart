import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'model/model_post_json.dart';

class ExamplePostJson extends StatefulWidget {
  final int countSeen;
  // ignore: use_key_in_widget_constructors
  const ExamplePostJson(this.countSeen);

  @override
  _ExamplePostJson createState() => _ExamplePostJson();
}

class _ExamplePostJson extends State<ExamplePostJson> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Example post from json'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, widget.countSeen + 1);
          },
        ),
      ]),
      body: Container(
        child: FutureBuilder<Post>(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(snapshot.data!.avatar),
                                  )),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(snapshot.data!.author,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold))
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
                      snapshot.data!.photo,
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
                            icon: const Icon(Icons.favorite),
                            color: Colors.black,
                            onPressed: () {},
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
                        children: [
                          Text(
                            snapshot.data!.author,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            snapshot.data!.description,
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
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
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(snapshot.data!.avatar)),
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
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: Text("Loading..."));
          },
        ),
      ),
    );
  }
}
