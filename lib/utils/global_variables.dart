import 'package:flutter/cupertino.dart';
import 'package:instagram_clone_flutter_firebase/screens/add_post_screen.dart';
import 'package:instagram_clone_flutter_firebase/screens/feed_screen.dart';
import 'package:instagram_clone_flutter_firebase/screens/profile_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  Text("Search"),
  AddPostScreen(),
  Text("Favourites"),
  ProfileScreen(),
];
