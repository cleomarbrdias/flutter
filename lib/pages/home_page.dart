import 'package:app/domain/posts.dart';
import 'package:app/domain/services/posts_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("CONASS"),
      ),
      body: _body(),
    );
  }
}

_body() {
  return Container(
    padding: EdgeInsets.all(16),
    child: FutureBuilder<List<Post>>(
        future: PostService.getPosts(),

        builder: (context, snapshot){

          if(snapshot.hasError){
            return Center(child: Text(
                "Nenhum post disponivel",
            style: TextStyle(
              fontSize: 26,
              color: Colors.grey,
            ),
            ));
          }else if(! snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }else{
            return _listView(snapshot.data);
          }

        }),
  );
}

_listView(List<Post> posts) {

  return ListView.builder(
      itemCount: 10,
      itemBuilder: (ctx, idx){

        final p = posts[idx];


    return Container(
      height: 380,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Image.network(p.img),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Text(
                  p.title,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,

                  ),
                ),
              ),
            )


            ,
        ButtonTheme.bar( // make buttons use the appropriate styles for cards
    child: ButtonBar(
    children: <Widget>[
    FlatButton(
    child: const Text('Leia mais...'),
        onPressed: () { /* ... */ },
        ),
        ],
        ),
        ),
          ],
        ),
      ),
    );
  });
}

