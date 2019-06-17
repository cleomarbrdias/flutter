import 'dart:async';
import 'dart:convert';
import 'package:app/domain/posts.dart';
import 'package:http/http.dart' as http;


    class PostService {

    static Future<List<Post>> getPosts() async {

    final url = "https://www.conass.org.br/wp-json/wp/v2/posts";

    //print("> get URL: $url");

    final response = await http.get(url);

    print(response.body);

    final mapPosts = json.decode(response.body).cast<Map<String, dynamic>>();

    //mapPosts OK
    print("> get Map: $mapPosts");

    final posts = mapPosts.map<Post>((json) => Post.fromJson(json)).toList();


    //não retorna conteudo
    print("> get Post: $posts");


    return posts;

    }
 }
