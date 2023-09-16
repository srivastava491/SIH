// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:mobile_app/const/global_variable.dart';

class HomeScreenFacility extends StatefulWidget {
  const HomeScreenFacility({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenFacility> createState() => _HomeScreenFacilityState();
}

class _HomeScreenFacilityState extends State<HomeScreenFacility> {
  String _responseMessage = ''; // To store the response message

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const String ID = "65062ad842e9b3953e2439c5";

    final Uri apiUrl =
        Uri.parse("$facility/$ID"); // Replace with your API endpoint URL

    try {
      final response = await http.get(
        apiUrl,
      );

      if (response.statusCode == 200) {
        final responseBody = response.body; // Get the entire response body
        // print('Response Body: $responseBody'); // Print the entire response body
        // final responseData = jsonDecode(responseBody);

        setState(() {
          _responseMessage = responseBody;
        });
      } else {
        setState(() {
          _responseMessage = 'Failed to fetch data: ${response.body}';
        });
      }
    } catch (e) {
      // print('Error: $e');
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
