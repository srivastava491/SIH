// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app/const/global_variable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _responseMessage = ''; // To store the response message

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const String authToken =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MDIzNGRmYWU1ZWE0MzdjODg4MTNiNCIsImlhdCI6MTY5NDY0MzU2NX0.i1OmAldmVG5qxoI5ZhmXMyT9j2f-lN2N9i6KMRPBW6M"; // Replace with your auth token

    final Uri apiUrl =
        Uri.parse(Verify_user_logged_in); // Replace with your API endpoint URL

    try {
      final response = await http.post(
        apiUrl,
        headers: <String, String>{
          'x-auth-token': authToken,
        },
      );

      if (response.statusCode == 200) {
        final responseBody = response.body; // Get the entire response body
        print('Response Body: $responseBody'); // Print the entire response body
        final responseData = jsonDecode(responseBody);

        setState(() {
          _responseMessage = responseBody;
        });
      } else {
        setState(() {
          _responseMessage = 'Failed to fetch data: ${response.body}';
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _responseMessage = 'An error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text(_responseMessage),
      ),
    );
  }
}
