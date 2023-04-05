import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matrimony_app/home.dart';
import 'package:matrimony_app/api/add_data.dart';

class AllName extends StatefulWidget {
  const AllName({super.key});

  @override
  State<AllName> createState() => _AllNameState();
}

class _AllNameState extends State<AllName> {
  bool isLoading = true;
  List Name = [];
  String filter = '';

  @override
  void initState() {
    super.initState();
    fetchNamesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("API List"),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
      ),
      // body: Visibility(
      //   visible: isLoading,
      //   replacement: Visibility(
      //     visible: Name.isEmpty,
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
                  itemCount: Name.length,
                  itemBuilder: (context, index) {

                    final user = Name[index] as Map;
                    final nameid = user["id"] as String;
                    if (!user["name"].toLowerCase().contains(filter)) {
                      return Container();
                    }
                    return Card(
                      color: Colors.white,
                      shadowColor: Colors.red,
                      shape: Border.all(color: Colors.redAccent),
                      elevation: 10,
                      margin: const EdgeInsets.all(15),
                      child: ListTile(
                        title: Text(user["name"]),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              icon: user["isLiked"]
                                  ? const Icon(Icons.favorite)
                                  : const Icon(Icons.favorite_border),
                              color: Colors.redAccent,
                              onPressed: () {
                                setState(() {
                                  user["isLiked"] = !user["isLiked"];
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                navigateToEditNamePage(user);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                deleteById(nameid);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('User Deleted Successfully!!'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
      //     child: const Center(
      //       child: Text("No Names"),
      //     ),
      //   ),
      //   child: const Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddNamePage,
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> navigateToAddNamePage() async {
    final route = MaterialPageRoute(
      builder: (context) => const AddNamePage(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchNamesData();
  }

  Future<void> navigateToEditNamePage(Map book) async {
    final route = MaterialPageRoute(
      builder: (context) => AddNamePage(
        name: book,
      ),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchNamesData();
  }

  Future<void> fetchNamesData() async {
    const url = "https://641e80bbf228f1a83ea50847.mockapi.io/jash/users/";
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      if (json != null) {
        setState(() {
          Name = json;
        });
      } else {
        if (kDebugMode) {
          print("Data is Null");
        }
      }
    } else {
      if (kDebugMode) {
        print("Something Went Wrong");
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> deleteById(String id) async {
    final url =
        "https://641e80bbf228f1a83ea50847.mockapi.io/jash/users/$id";
    final uri = Uri.parse(url);
    final response = await http.delete(uri);

    if (response.statusCode == 200) {
      final filtered = Name.where((element) => element["id"] != id).toList();
      setState(() {
        Name = filtered;
      });
    } else {
      if (kDebugMode) {
        print("Deletion Failed");
      }
    }
  }
}
