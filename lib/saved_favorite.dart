import 'package:flutter/material.dart';

class SavedFavorite extends StatefulWidget {
  const SavedFavorite({Key? key}) : super(key: key);

  @override
  _SavedFavorite createState() => _SavedFavorite();
}

class _SavedFavorite extends State<SavedFavorite> {
  bool isShowImage = false;
  String link = "";

  void changeIsShowImage() {
    setState(() {
      isShowImage = !isShowImage;
    });
  }

  Image showImage(link) {
    return Image.network(
      link,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Photo was saved'),
        ),
        body: Center(
            child: Column(children: <Widget>[
          const Text("This photo was saved"),
          IconButton(
            icon: const Icon(Icons.photo_camera),
            onPressed: () {
              link = ModalRoute.of(context)!.settings.arguments.toString();
              changeIsShowImage();
            },
          ),
          isShowImage ? ShowImage(link) : ShowText()
        ])));
  }
}

class ShowImage extends StatelessWidget {
  final String link;
  // ignore: use_key_in_widget_constructors
  const ShowImage(this.link);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      link,
      fit: BoxFit.cover,
    );
  }
}

// ignore: use_key_in_widget_constructors
class ShowText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("For show image - click button.");
  }
}
