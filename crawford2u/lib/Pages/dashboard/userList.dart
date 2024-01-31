
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgentListPage extends StatefulWidget {
  @override
  _AgentListPageState createState() => _AgentListPageState();
}

class _AgentListPageState extends State<AgentListPage> {
  List<dynamic> agentList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('http://localhost:5051/agent/getAllAgentList');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response,
        // parse the JSON response and update the state.
        final dynamic responseData = jsonDecode(response.body);

        if (responseData is List) {
          setState(() {
            agentList = responseData;
          });
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error during API call: $error');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agent List'),
      ),
      body: agentList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: agentList.length,
              itemBuilder: (context, index) {
                final agent = agentList[index];
                return ListTile(
                  title: Text('Agent ID: ${agent['_id']}'),
                  subtitle: Text('Name: ${agent['firstName']} ${agent['lastName']}'),
                  // Add more details as needed
                );
              },
            ),
    );
  }
}
