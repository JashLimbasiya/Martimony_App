import 'package:matrimony_app/database/detail.dart';
import 'package:matrimony_app/database/user_list.dart';
import 'package:flutter/material.dart';

class LikedUsers extends StatelessWidget {
  final List<User> userList;
  const LikedUsers({Key? key, required this.userList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final likedUsers = userList.where((user) => user.isliked).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Liked Users'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), onPressed: () { 
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (contect) => const UserList()));
        },
        ),
      ),
      body: ListView.builder(
        itemCount: likedUsers.length,
        itemBuilder: (context, index) {
          final user = likedUsers[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.city),
          );
        },
      ),
    );
  }
}