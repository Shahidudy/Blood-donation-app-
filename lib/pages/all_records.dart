import 'package:blood_donation/pages/splash_two.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllRecords extends StatefulWidget {
  const AllRecords({super.key});

  @override
  State<AllRecords> createState() => _AllRecordsState();
}

class _AllRecordsState extends State<AllRecords> {
  List<String> _records = [];

  @override
  void initState() {
    _loadRecords();
    super.initState();
  }

  void _loadRecords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _records = prefs.getStringList('records') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Records'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: _records.length,
          itemBuilder: (context, index) {
            final recordDetails = _records[index].split(',');
            final name = recordDetails[0];
            final age = recordDetails[1];
            final phoneNumber = recordDetails[2];
            final address = recordDetails[3];
            final bloodgroup = recordDetails[4];
            final type = recordDetails[5];
            final time = recordDetails[6];

            return ListTile(
              leading: CircleAvatar(
                child: Text(bloodgroup),
              ),
              title: Text(
                "$name  ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Age : $age"),
                        Text("Mob No :$phoneNumber"),
                        Text("State :$address"),
                        Text(
                          "$time",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                type == 'Donor' ? Colors.red : Colors.green),
                        child: Text(
                          type,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
              // trailing: Text('heloo'),
            );
          }),
      floatingActionButton: Container(
        height: 25,
        // width: 40,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => SplashTwo()));
            },
            style: ElevatedButton.styleFrom(),
            child: Text('Go Back')),
      ),
    );
  }
}
