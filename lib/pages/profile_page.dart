import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = '';
  String _age = '';
  String _phoneNumber = '';
  String _address = '';
  String _bloodGroup = '';
  String _type = '';

  void loadProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name') ?? 'No Name';
    _age = prefs.getString('age') ?? '';
    _phoneNumber = prefs.getString('phoneNumber') ?? '';
    _address = prefs.getString('address') ?? '';
    _type = prefs.getString('type') ?? '';
    _bloodGroup = prefs.getString('bloodGroup') ?? '';
  }

  @override
  void initState() {
    loadProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_name),
              Text(_phoneNumber),
              Text(_age),
              Text(_address),
              Text(_bloodGroup),
              Text(_type),
            ],
          ),
        ),
      ),
    );
  }
}
