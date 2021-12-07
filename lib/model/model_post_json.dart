import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  final int id;
  final String author;
  final String avatar;
  final String photo;
  final String description;

  Post({
    required this.id,
    required this.author,
    required this.avatar,
    required this.photo,
    required this.description,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      author: json['author'],
      avatar: json['avatar'],
      photo: json['photo'],
      description: json['description'],
    );
  }
}

Future<Post> fetchPost() async {
  final response = await http.get(Uri.parse(
      'https://instagram-backend-flutter-labs.herokuapp.com/api/post/1'));

  if (response.statusCode == 200) {
    print(response.body);
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(
        'Loading error with status code' + response.statusCode.toString());
  }
}
