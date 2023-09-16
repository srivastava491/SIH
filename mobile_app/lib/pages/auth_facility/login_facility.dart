import 'package:flutter/material.dart';
import 'package:mobile_app/const/colors.dart';
import 'package:mobile_app/pages/auth/signup_page.dart';
import 'package:mobile_app/pages/home/home_screen.dart';
import 'package:mobile_app/widgets/custom_text_feild.dart';

class LoginScreenFacility extends StatefulWidget {
  const LoginScreenFacility({super.key});

  @override
  State<LoginScreenFacility> createState() => _LoginScreenFacilityState();
}

class _LoginScreenFacilityState extends State<LoginScreenFacility> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      _isLoading = false;
    });
    const res = "success";
    if (res == 'success') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res),
        ),
      );
    }
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
                "Login Facility",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              // text input fields
              const SizedBox(
                height: 24,
              ),
              CustomTextFeild(
                textEditingController: _emailController,
                isPass: false,
                hintText: 'Enter your Email',
                textInputType: TextInputType.emailAddress,
              ),
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
              GestureDetector(
                onTap: () => loginUser(),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    color: buttonColor,
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Login'),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?      ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      ),
                    },
                    child: const Text(
                      'Sign UP',
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
}
