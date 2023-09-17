import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app/const/global_variable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Map<String, dynamic>> userData;
  List<dynamic> ewasteFacilities = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    userData = getData();
    fetchData();
  }

  Future<Map<String, dynamic>> getData() async {
    const String authToken = user_auth_token;
    final Uri apiUrl = Uri.parse(Verify_user_logged_in);

    try {
      final response = await http.post(
        apiUrl,
        headers: <String, String>{
          'x-auth-token': authToken,
        },
      );

      if (response.statusCode == 200) {
        final responseBody = response.body;
        final responseData = jsonDecode(responseBody);
        // print('User Data Received: $responseData'); // Print received data
        return responseData;
      } else {
        throw Exception('Failed to fetch data: ${response.body}');
      }
    } catch (e) {
      // print('Error fetching data: $e'); // Print error message
      throw Exception('An error occurred: $e');
    }
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(facility));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          ewasteFacilities = data;
          isLoading = false;
        });
        // print('Facility Data Received: $data'); // Print received data
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      // print('Error fetching data: $e'); // Print error message
      throw Exception('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error.toString()}'),
            );
          } else if (snapshot.hasData) {
            final userData = snapshot.data!;
            return Column(
              children: [
                UserProfileWidget(userData: userData),
                FacilityList(ewasteFacilities: ewasteFacilities),
              ],
            );
          } else {
            return Center(
              child: Text('No data available.'),
            );
          }
        },
      ),
    );
  }
}

class UserProfileWidget extends StatelessWidget {
  final Map<String, dynamic> userData;

  UserProfileWidget({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract user information from userData
    final userName = userData['user']['name'] as String? ?? '';
    final userEmail = userData['user']['email'] as String? ?? '';
    final userCreditPoints = userData['user']['creditPoint'] as int? ?? 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 16),
          Text(
            userName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Email: $userEmail',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          Text(
            'Credit Points: $userCreditPoints',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text("To UPI"),
          ),
        ],
      ),
    );
  }
}

class FacilityList extends StatelessWidget {
  final List<dynamic> ewasteFacilities;

  FacilityList({Key? key, required this.ewasteFacilities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: ewasteFacilities.length,
        itemBuilder: (context, index) {
          final facility = ewasteFacilities[index];
          return FacilityListItem(facility: facility);
        },
      ),
    );
  }
}

class FacilityListItem extends StatelessWidget {
  final dynamic facility;

  FacilityListItem({Key? key, required this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        facility['name'],
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location: ${facility['location']}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(
            'Type: ${facility['type']}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Text(
            'Description: ${facility['description']}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => FacilityDetailsScreen(
                  facility: facility,
                )),
          ),
        );
      },
    );
  }
}

class FacilityDetailsScreen extends StatelessWidget {
  final dynamic facility;

  FacilityDetailsScreen({Key? key, required this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract facility details
    final facilityName = facility['name'];
    final facilityDescription = facility['description'];

    // Extract latitude and longitude from facilityCoordinates
    final coordinates = facility['coordinates'];
    print("coordinate = $coordinates");
    final longitude = coordinates['coordinates'][1]; // Index 1 is the latitude
    final latitude = coordinates['coordinates'][0]; // Index 0 is the longitude

    print("latitude = $latitude");
    print("longitude = $longitude");
    Future<void> _openMaps(double latitude, double longitude) async {
      final url =
          'https://maps.google.com/?q=$latitude,$longitude'; // Adjust the URL for your desired map application
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url);
      } else {
        throw 'Could not launch Maps';
      }
    }
    // TODO: Use the Bing Maps API to display the map view based on facilityCoordinates.

    return Scaffold(
      appBar: AppBar(
        title: Text(facilityName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              facilityDescription,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _openMaps(latitude, longitude);
              },
              child: Text('Open Maps'),
            ),
          ],
        ),
      ),
    );
  }
}
