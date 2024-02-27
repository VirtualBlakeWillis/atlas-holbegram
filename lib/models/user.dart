import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  Users({
    required this.uid,
    required this.email,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
    required this.posts,
    required this.saved,
    required this.searchKey,
  });

  final String uid;
  final String email;
  final String bio;
  final String photoUrl;
  final List<dynamic> followers;
  final List<dynamic> following;
  final List<dynamic> posts;
  final List<dynamic> saved;
  final String searchKey;

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      uid: json['uid'] as String,
      email: json['email'] as String,
      bio: json['bio'] as String,
      photoUrl: json['photoUrl'] as String,
      followers: json['followers'] as List<dynamic>,
      following: json['following'] as List<dynamic>,
      posts: json['posts'] as List<dynamic>,
      saved: json['saved'] as List<dynamic>,
      searchKey: json['searchKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'bio': bio,
      'photoUrl': photoUrl,
      'followers': followers,
      'following': following,
      'posts': posts,
      'saved': saved,
      'searchKey': searchKey,
    };
  }
}
