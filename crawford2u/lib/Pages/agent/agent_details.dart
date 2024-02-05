import 'package:crawford2u/app_constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:retry/retry.dart';

class AgentDetails extends StatefulWidget {
  const AgentDetails({Key? key}) : super(key: key);

  @override
  _AgentDetailsState createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails> {
  late List<Map<String, dynamic>> agents=[];

  @override
  void initState() {
    super.initState();
    fetchAgentData();
  }

Future<void> fetchAgentData() async {
  try {
    await retry(
      () async {final response = await http.get(Uri.parse('http://127.0.0.1:5052/agent/getAllAgentList'));

    if (response.statusCode == 201) {
      final dynamic responseData = json.decode(response.body);

      if (responseData['status'] == 'SUCCESS') {
        final List<dynamic> agentList = responseData['data']['agentDetailsList'];

        if (agentList.isNotEmpty) {
          setState(() {
            agents = List<Map<String, dynamic>>.from(agentList);
          });
        } else {
          throw Exception('No agents found');
        }
      } else {
        throw Exception('API response indicates failure');
      }
    } else {
      throw Exception('Failed to load agent data. Status code: ${response.statusCode}');
    }});
    
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
    if (agents == true) {
      // Loading state or error handling can be added here
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: agents.length,
      itemBuilder: (context, index) {
        return GetCard(
          firstName: agents[index]['firstName'],
          email: agents[index]['email'],
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
