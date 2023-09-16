import 'package:flutter/material.dart';
import 'package:mobile_app/const/colors.dart';
import 'package:mobile_app/pages/auth/login_page.dart';
import 'package:mobile_app/pages/home/home_screen.dart';
import 'package:mobile_app/widgets/custom_text_feild.dart';

class SignUpFacilityScreen extends StatefulWidget {
  const SignUpFacilityScreen({super.key});

  @override
  State<SignUpFacilityScreen> createState() => _SignUpScreenFacilityState();
}

class _SignUpScreenFacilityState extends State<SignUpFacilityScreen> {
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

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    // setup time for 600 ms
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      _isLoading = false;
    });
    const res = "success";
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
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
