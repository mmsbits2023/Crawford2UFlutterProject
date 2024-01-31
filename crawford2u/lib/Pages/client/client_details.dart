/*import 'package:crawford2u/app_constant/app_theme.dart';
import 'package:flutter/material.dart';

class Client_Details extends StatelessWidget {
  const Client_Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.white,
      body: getBody(), 
    );
  }

  Widget getBody(){
    List items=[ 
      "1",
      "2",
      "3",
      "4",
      "5"
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) { 
        return GetCard();
      },
    );
  }

  Widget GetCard(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card( 
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile( 
            title: Row( 
              children: [ 
                Container( 
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration( 
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(60/2),
                    image: DecorationImage(  
                      fit: BoxFit.cover,
                      image: NetworkImage("https://media.istockphoto.com/id/1368424494/photo/studio-portrait-of-a-cheerful-woman.jpg?s=1024x1024&w=is&k=20&c=9eszAhNKMRzMHVp4wlmFRak8YyH3rAU8re9HjKA6h3A="))
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Abc xyz",
                    style: TextStyle(fontSize: 20),),
                    SizedBox(height: 10,),
                    Text("abc@gmail.com", style: TextStyle(fontSize: 16, color: Colors.grey),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}*/
import 'package:crawford2u/app_constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:retry/retry.dart';

class ClientDetails extends StatefulWidget {
  const ClientDetails({Key? key}) : super(key: key);

  @override
  _ClientDetailsState createState() => _ClientDetailsState();
}

class _ClientDetailsState extends State<ClientDetails> {
  late List<Map<String, dynamic>> clients=[];

  @override
  void initState() {
    super.initState();
    fetchClientData();
  }

Future<void> fetchClientData() async {
  try {
    await retry(
      () async {
      final response = await http.get(Uri.parse('http://localhost:5051/client/getAllClientList'));

    if (response.statusCode == 201) {
      final dynamic responseData = json.decode(response.body);

      if (responseData['status'] == 'SUCCESS') {
        final List<dynamic> clientList = responseData['data']['clientDetailsList'];

        if (clientList.isNotEmpty) {
          setState(() {
            clients = List<Map<String, dynamic>>.from(clientList);
          });
        } else {
          throw Exception('No clientss found');
        }
      } else {
        throw Exception('API response indicates failure');
      }
    } else {
      throw Exception('Failed to load client data. Status code: ${response.statusCode}');
    }
    });
    
  } catch (error) {
    print(error.toString());
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    if (clients == true) {
      // Loading state or error handling can be added here
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (context, index) {
        return GetCard(
          firstName: clients[index]['firstName'],
          email: clients[index]['email'],
          //profileImageUrl: agents[index]['profileImageUrl'],
        );
      },
    );
  }

  Widget GetCard({required String firstName, required String email}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(60 / 2),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage("https://media.istockphoto.com/id/1368424494/photo/studio-portrait-of-a-cheerful-woman.jpg?s=1024x1024&w=is&k=20&c=9eszAhNKMRzMHVp4wlmFRak8YyH3rAU8re9HjKA6h3A=")),
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstName,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      email,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
