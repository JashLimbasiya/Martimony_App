import 'package:matrimony_app/database/dbhelper.dart';
import 'package:matrimony_app/database/edit.dart';
import 'package:matrimony_app/database/liked_user.dart';
import 'package:matrimony_app/database/detail.dart';
import 'package:matrimony_app/database/tap_user.dart';
import 'package:matrimony_app/database/add_user.dart';
import 'package:flutter/material.dart';
import 'package:matrimony_app/home.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final dbHelper = DatabaseProvider.db;
  List<User> userList = [];
  String filter = '';

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Database List'),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LikedUsers(userList: userList)));
              },
              icon: const Icon(Icons.favorite_border_outlined))
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                cursorColor: Colors.red,
                onChanged: (val) {
                  setState(() {
                    filter = val.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search User Here....",
                  prefixIcon: const Icon(Icons.search),
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
                final user = userList[index];
                if (!user.name.toLowerCase().contains(filter)) {
                  return Container();
                }
                return Card(
                  color: Colors.white,
                  shadowColor: Colors.red,
                  shape: Border.all(color: Colors.redAccent),
                  elevation: 10,
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.city),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          icon: user.isliked
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                          color: Colors.redAccent,
                          onPressed: () {
                            setState(() {
                              user.isliked = !user.isliked;
                              dbHelper.update(user);
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditUser(
                                          user: user,
                                        )));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _deleteUser(user.id!);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserList()));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('User Deleted Successfully!!'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowUser(
                                    user: user,
                                  )));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddUser(),
            ),
          ).then((value) => _getUsers());
        },
      ),
    );
  }

  Future<void> _getUsers() async {
    final list = await dbHelper.getAllUsers();
    setState(() {
      userList.clear();
      userList.addAll(list);
    });
  }

  Future<void> _deleteUser(int id) async {
    final count = await dbHelper.delete(id);
    if (count > 0) {
      _deleteUser(id);
    }
  }
}
