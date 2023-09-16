// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mobile_app/const/colors.dart';
import 'package:mobile_app/pages/auth_facility/login_facility.dart';
import 'package:mobile_app/pages/home/home_screen_facility.dart';
import 'package:mobile_app/widgets/custom_text_feild.dart';

class SignUpFacilityScreen extends StatefulWidget {
  const SignUpFacilityScreen({super.key});

  @override
  State<SignUpFacilityScreen> createState() => _SignUpScreenFacilityState();
}

class _SignUpScreenFacilityState extends State<SignUpFacilityScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    _typeController.dispose();
    _locationController.dispose();
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
              const SizedBox(
                height: 36,
              ),
              const Text(
                "Signup Facility",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              // text input fields
              const SizedBox(
                height: 24,
              ),
              CustomTextFeild(
                  textEditingController: _nameController,
                  isPass: false,
                  hintText: 'Enter Facility Name',
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFeild(
                  textEditingController: _emailController,
                  isPass: false,
                  hintText: 'Enter Email',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              CustomTextFeild(
                  textEditingController: _addressController,
                  isPass: false,
                  hintText: 'Enter Address',
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFeild(
                  textEditingController: _descriptionController,
                  isPass: false,
                  hintText: 'Enter Description',
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFeild(
                  textEditingController: _typeController,
                  isPass: false,
                  hintText: 'Enter Type',
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFeild(
                  textEditingController: _locationController,
                  isPass: false,
                  hintText: 'Enter Location',
                  textInputType: TextInputType.text),
              //button
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () => signUpFacility(),
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
                      : const Text('Sign Up'),
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
                          builder: ((context) => const LoginScreenFacility()),
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

  void signUpFacility() async {
    setState(() {
      _isLoading = true;
    });
    // Simulate a signup process (you can replace this with an actual API call)
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      _isLoading = false;
    });

    // Assuming signup is successful, navigate to the home screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreenFacility()),
    );
  }
}
