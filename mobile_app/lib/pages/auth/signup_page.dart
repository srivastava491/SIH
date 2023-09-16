// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile_app/const/colors.dart';
import 'package:mobile_app/const/global_variable.dart';
import 'package:mobile_app/pages/auth/login_page.dart';
import 'package:mobile_app/pages/home/home_screen.dart';
import 'package:mobile_app/widgets/custom_text_feild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // text input fields

              const SizedBox(
                height: 16,
              ),
              CustomTextFeild(
                  textEditingController: _usernameController,
                  isPass: false,
                  hintText: 'Enter your Name',
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFeild(
                  textEditingController: _emailController,
                  isPass: false,
                  hintText: 'Enter your Email',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              CustomTextFeild(
                  textEditingController: _addressController,
                  isPass: false,
                  hintText: 'Enter your Address',
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFeild(
                  textEditingController: _passwordController,
                  isPass: true,
                  hintText: 'Enter your Password',
                  textInputType: TextInputType.visiblePassword),
              //button
              const SizedBox(
                height: 16,
              ),
              CustomTextFeild(
                  textEditingController: _passwordController,
                  isPass: true,
                  hintText: 'Confirm Password',
                  textInputType: TextInputType.visiblePassword),
              //button
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () => signUpUser(),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      color: buttonColor),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        )
                      : const Text('Sign UP'),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?      ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const LoginScreen()),
                        ),
                      ),
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    // setup time for 600 ms
    final Map<String, dynamic> data = {
      'email': _emailController.text,
      'password': _passwordController.text,
      'name': _usernameController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(Register_User_API), // Use the constant here
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // final sharedPreferences = await SharedPreferences.getInstance();
        // ignore: unused_local_variable
        final token = responseData['token'];
        // await sharedPreferences.setString('x-auth-token', token);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        // print('Response Body: ${response.body}');
      } else {
        // print('Response Body: ${response.body}');

        // User login failed
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('SignUP failed. Please try again.'),
          ),
        );
      }
    } catch (e) {
      // print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again later.'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      duration: const Duration(seconds: 2),
    ),
  );
}
