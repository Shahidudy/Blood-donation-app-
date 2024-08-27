import 'package:blood_donation/pages/all_records.dart';
import 'package:blood_donation/widgets/customTextFrmField.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DonatePage extends StatefulWidget {
  DonatePage({
    super.key,
  });

  @override
  State<DonatePage> createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  final _formKey = GlobalKey<FormState>();

  int myIndex = 0;

  String _name = '';
  String _age = '';
  String _phoneNumber = '';
  String _address = '';
  String _bloodGroup = 'A+';
  String _type = 'Donor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 167, 119, 116),
      appBar: AppBar(
        title: Text('Donate Form'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              //TEXT FIELD SECTION
              customTextformFiled(
                  labelText: 'Enter your Name',
                  validateFun: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                  onSavedFun: (value) {
                    _name = value!;
                    print(_name);
                  }),
              customTextformFiled(
                  labelText: 'Age',
                  validateFun: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                  onSavedFun: (value) {
                    _age = value!;
                    print(_age);
                  }),
              customTextformFiled(
                  labelText: 'Phone Number',
                  validateFun: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Number';
                    }
                    return null;
                  },
                  onSavedFun: (value) {
                    _phoneNumber = value!;
                    print(_phoneNumber);
                  }),
              customTextformFiled(
                  labelText: 'Your State',
                  validateFun: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your State in one word';
                    }
                    return null;
                  },
                  onSavedFun: (value) {
                    _address = value!;
                    print(_address);
                  }),

              //BLOOD GROUPS SECTION
              Container(
                margin: EdgeInsets.only(left: 25, top: 20),
                child: Text(
                  'Choose your blood group',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                height: 270,
                // color: Colors.red,
                child: GridView.count(
                  padding: EdgeInsets.all(6),
                  childAspectRatio: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: [
                    customBloodGroups(selectedBlood: 'A+', index: 8),
                    customBloodGroups(selectedBlood: 'A-', index: 1),
                    customBloodGroups(selectedBlood: 'B+', index: 2),
                    customBloodGroups(selectedBlood: 'B-', index: 3),
                    customBloodGroups(selectedBlood: 'O+', index: 4),
                    customBloodGroups(selectedBlood: 'O-', index: 5),
                    customBloodGroups(selectedBlood: 'AB+', index: 6),
                    customBloodGroups(selectedBlood: 'AB-', index: 7),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    submitForm();
                  },
                  child: Text(
                    'Upload',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> records = prefs.getStringList('records') ?? [];
      String newRecords =
          '$_name, $_age, $_phoneNumber, $_address, $_bloodGroup, $_type, ${DateTime.now()}';
      records.add(newRecords);
      prefs.setStringList('records', records);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => AllRecords(),
        ),
      );
    }
  }

  Widget customBloodGroups(
      {required String selectedBlood, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          myIndex = index;
          _bloodGroup = selectedBlood;
        });
      },
      child: Container(
        height: 20,
        decoration: BoxDecoration(
            color: myIndex == index ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Center(child: Text(selectedBlood)),
      ),
    );
  }
}
