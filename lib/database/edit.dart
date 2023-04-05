import 'package:matrimony_app/database/dbhelper.dart';
import 'package:matrimony_app/database/detail.dart';
import 'package:matrimony_app/database/user_list.dart';
import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  final User user;

  const EditUser({Key? key, required this.user}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  //late String _gender;
  late String _city;
  late String _description;
  late bool _isliked;

  @override
  void initState() {
    super.initState();
    _name = widget.user.name;
    _city = widget.user.city;
    _genderValue = widget.user.gender;
    _description = widget.user.description;
    _isliked = widget.user.isliked;
  }

  String _genderValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Edit User'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const UserList()));
          },
          icon: (const Icon(Icons.arrow_back)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                initialValue: _city,
                decoration: const InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city';
                  }
                  return null;
                },
                onSaved: (value) => _city = value!,
              ),
              const SizedBox(height: 16.0),
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
              TextFormField(
                initialValue: _description,
                decoration: const InputDecoration(labelText: 'description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
                onSaved: (value) => _description = value!,
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.only(left: 105),
                child: FloatingActionButton.extended(
                  onPressed: _submitForm,
                  backgroundColor: Colors.red,
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Users'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _updateUser();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const UserList()));
    }
  }

  void _updateUser() {
    final updatedUser = widget.user.copyWith(
        name: _name,
        city: _city,
        gender: _genderValue,
        description: _description,
        isliked: _isliked,
    );
    DatabaseProvider.db.update(updatedUser);
  }
}
