import 'package:matrimony_app/database/dbhelper.dart';
import 'package:matrimony_app/database/detail.dart';
import 'package:matrimony_app/database/user_list.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String dropdownvalue = 'Select Gender';
  String _genderValue = '';
  var items = [
    'Select Gender',
    'Male',
    'Female',
    'Other',
  ];
  final TextEditingController _nameController = TextEditingController();
  //final TextEditingController _genderController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final dbHelper = DatabaseProvider.db;

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Add User'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  // TextFormField(
                  //   controller: _genderController,
                  //   decoration: const InputDecoration(
                  //     labelText: 'Gender',
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  // Text("Gender"),
                  // SizedBox(height: 8),
                  // DropdownButton(
                  //   value: dropdownvalue,
                  //   icon: const Icon(Icons.keyboard_arrow_down),
                  //   items: items.map((String items) {
                  //     return DropdownMenuItem(
                  //       value: items,
                  //       child: Text(items),
                  //     );
                  //   }).toList(),
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       dropdownvalue = newValue!;
                  //     });
                  //   },
                  // ),
                  const Text(
                    'Gender',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Male'),
                          value: 'Male',
                          groupValue: _genderValue,
                          onChanged: (value) {
                            setState(() {
                              _genderValue = value!;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Female'),
                          value: 'Female',
                          groupValue: _genderValue,
                          onChanged: (value) {
                            setState(() {
                              _genderValue = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // DropdownButtonFormField<String>(
                  //   value: dropdownvalue,
                  //   decoration: const InputDecoration(
                  //     labelText: 'City',
                  //     border: OutlineInputBorder(),
                  //   ),
                  //   items: dropdownvalue.map((String value) {
                  //     return DropdownMenuItem<String>(
                  //         value: value,
                  //         child: Text(value));
                  //   }).toList(),
                  //   onChanged: (String? newvalue) {
                  //     setState(() {
                  //       dropdownvalue = newvalue!;
                  //     });
                  //   },
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'please selected a city';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: FloatingActionButton.extended(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              final user = User(
                                name: _nameController.text,
                                gender: _genderValue,
                                city: _cityController.text,
                                description: _descriptionController.text,
                              );
                              await dbHelper.insert(user);
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('User Added Successfully!!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          },
                          backgroundColor: Colors.red,
                          icon: const Icon(Icons.add),
                          label: const Text('Add User')
                        ),
                      ),
                      const SizedBox(width: 26),
                      Expanded(
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserList(),
                              ),
                            );
                          },
                          backgroundColor: Colors.red,
                          icon: const Icon(Icons.update),
                          label: const Text('Display Users'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
