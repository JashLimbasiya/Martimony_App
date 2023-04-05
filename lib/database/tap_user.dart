import 'package:matrimony_app/database/detail.dart';
import 'package:flutter/material.dart';

class ShowUser extends StatefulWidget {
  const ShowUser({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<ShowUser> createState() => _ShowUserState();
}

class _ShowUserState extends State<ShowUser> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.user.name),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID :- ${widget.user.id}",
                style: const TextStyle(fontSize: 20, color: Colors.red)),
            const SizedBox(
              height: 15,
            ),
            Text("Name :- ${widget.user.name}",
                style: const TextStyle(fontSize: 20, color: Colors.red)),
            const SizedBox(
              height: 15,
            ),
            Text("Gender :- ${widget.user.gender}",
                style: const TextStyle(fontSize: 20, color: Colors.red)),
            const SizedBox(
              height: 15,
            ),
            Text("City :- ${widget.user.city}",
                style: const TextStyle(fontSize: 20, color: Colors.red)),
            const SizedBox(
              height: 15,
            ),
            Text("Description :- ${widget.user.description}",
                style: const TextStyle(fontSize: 20, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
