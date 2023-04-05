import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddNamePage extends StatefulWidget {
  final Map? name;
  const AddNamePage({super.key, this.name});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController bookNameController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    final book = widget.name;
    if (book != null) {
      isEdit = true;
      final userName = book["name"];
      bookNameController.text = userName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(isEdit ? "Edit Name Page" : "Add Name Page"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          TextField(
            controller: bookNameController,
            decoration: const InputDecoration(hintText: "Enter User Name"),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
            onPressed: isEdit ? editBook : addBook,
            backgroundColor: Colors.red,
            label: Text(isEdit ? "Edit Name" : "Add User Name"),
          ),
        ],
      ),
    );
  }

  Future<void> addBook() async {
    final username = bookNameController.text;

    final body = {
      "name": username,
    };

    print(username);

    final url = "https://641e80bbf228f1a83ea50847.mockapi.io/jash/users/";
    final uri = Uri.parse(url);

    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      bookNameController.text = "";
      print("data Creation sucess");
      print(response.body);
    } else {
      print("data Creation Failed");
      print(response.body);
    }
  }

  Future<void> editBook() async {
    final name = widget.name;
    if (name == null) {
      print("You cannot call Updated method without book");
      return;
    }
    final id = name["id"];

    final Name = bookNameController.text;

    final body = {
      "name": Name,
    };

    final url = "https://641e80bbf228f1a83ea50847.mockapi.io/jash/users/$id";
    final uri = Uri.parse(url);

    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      bookNameController.text = "";
      print("Updation Success");
      print(response.body);
    } else {
      print("Updation Failed");
      print(response.body);
    }
  }
}
