class Post {
  String userUId;
  String imgUrl;
  String caption;
  String postOwnerPhotoUrl;
  String postOwnerDisplayName;

  Post(
      {this.userUId,
      this.imgUrl,
      this.caption,
      this.postOwnerDisplayName,
      this.postOwnerPhotoUrl});

  factory Post.fromMap(Map<String, dynamic> map) => Post(
      userUId: map['uid'],
      caption: map['caption'],
      imgUrl: map['imgUrl'],
      postOwnerDisplayName: map['postOwnerDisplayName'],
      postOwnerPhotoUrl: map['postOwnerPhotoUrl']);

  toMap(Post post) => {
        'uid': post.userUId,
        'caption': post.caption,
        'imgUrl': post.imgUrl,
        'postOwnerDisplayName': post.postOwnerDisplayName,
        'postOwnerPhotoUrl': post.postOwnerPhotoUrl,
      };
}
