import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Learning Grid view",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 25,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          ),
        ],
        leading: Icon(Icons.menu_book),
      ),

      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              labelColor: Colors.black, // Added so you can see the text
              tabs: [
                Tab(text: "Map"),
                Tab(text: "List"),
              ],
            ),
            Expanded(child: 
            TabBarView(
              children:[
                ContactItem(),
                HospitalListView()
                
            ]
          ),
          ),
          ],
        ),
      ),
      
    );
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem({super.key });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Hospital Name",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call, color: Colors.green, size: 40),
                      Icon(
                        Icons.message,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                    ],
                  ),

                  SizedBox(height: 24,),
                  Text(
                    "History",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text("Aga Khan Kenya,s best private hospital",
                    textAlign: TextAlign.center,),
                ],
              ),
            );
          },
        );
      },
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.add_box_outlined),
      ),
      title: Text(
        "Getrude Pediatric Hospital",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("50 Ambulances Available"),
    );
  }
}


class HospitalListView extends StatelessWidget {
  const HospitalListView({super.key});

  @override
  Widget build(BuildContext context) {
    // Imagine this is your data source
    final List<String> hospitalNames = [
      "Gertrude Pediatric",
      "Aga Khan University",
      "Nairobi Hospital",
      "Kenyatta National",
      "Mater Hospital",
    ];

    return ListView.builder(
      itemCount: hospitalNames.length, // Tells Flutter how many rows to make
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        // This runs for every item in your list
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.local_hospital, color: Colors.blue),
            ),
            title: Text(
              hospitalNames[index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("Open 24 Hours"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              print("Tapped on ${hospitalNames[index]}");
            },
          ),
        );
      },
    );
  }
}
            //Button with inkwell

            // InkWell(
            //   onTap: (){
            //     print("User request to create account");
            //     Navigator.push(context,
            //     MaterialPageRoute(builder:(context)=> LoginPage()));
            //   },
            //   child: Text(
            //     "Create Account",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontFamily: "Poppins",
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //       letterSpacing: 1.0
            //     ),)
            // ),





// class HospitalList extends StatelessWidget {
//   const HospitalList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var hospitalNoti = Provider.of<HospitalNotifier>(context);
//     List<Hospital> hospitals = hospitalNoti.hospitals;
//     return ListView.builder(
//       itemCount: hospitals.length,
//       itemBuilder: (context, index) {
//         var hospital = hospitals[index];
//         return ContactItem(hospital: hospital);
//       },
//     );
//   }
// }