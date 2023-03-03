import 'package:flutter/material.dart';
import 'package:wed_app/screens/addPage.dart';
import 'package:wed_app/services/services.dart';
import 'package:wed_app/services/snackbar.dart';
import 'package:wed_app/services/todocard.dart';

class ApiOperationPage extends StatefulWidget {
  const ApiOperationPage({Key? key}) : super(key: key);

  @override
  State<ApiOperationPage> createState() => _ApiOperationPageState();
}

class _ApiOperationPageState extends State<ApiOperationPage> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(child: Text("API Curd")),
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.white),
        child: Visibility(
          visible: isLoading,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
          replacement: RefreshIndicator(
            onRefresh: fetchTodo,
            child: Visibility(
              visible: items.isNotEmpty,
              replacement: const Center(
                child: Text(
                  'No Data in API',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              child: ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.all(4),
                itemBuilder: (context, index) {
                  final item = items[index] as Map;
                  final id = item['_id'] as String;
                  return TodoCard(
                      index: index,
                      item: item,
                      navigateEdit: navigateToEditPage,
                      deleteById: deleteById);
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red,
          onPressed: navigateToAddPage, label: const Icon(Icons.add)),
    );
  }

  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(builder: (context) => const AddApiPage());
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> navigateToEditPage(Map item) async {
    final route =
    MaterialPageRoute(builder: (context) => AddApiPage(api: item));
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> deleteById(String id) async {
    // delete Id
    final isSuccess = await TodoServices.deleteById(id);
    if (isSuccess) {
      // Remove item from List
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      //Show Error
      showErrorMsg(context, msg: 'Deletion Failed');
    }
  }

  Future<void> fetchTodo() async {
    final response = await TodoServices.fetchTodo();
    if (response != null) {
      setState(() {
        items = response;
      });
    } else {
      showErrorMsg(context, msg: 'Something Went to Wrong');
    }
    setState(() {
      isLoading = false;
    });
  }
}