class Post{


final String img;
final String title;

  Post(
      {this.title,
        this.img
      });

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      title: json['title'] as String,
      img: json['jetpack_featured_media_url'] as String,
    );
  }



}


