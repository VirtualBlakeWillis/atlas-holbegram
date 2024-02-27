import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import 'signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:holbegram/methods/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 58,
            ),
            const Text(
              'Holbegram',
              style: TextStyle(fontFamily: "Billabong", fontSize: 50),
            ),
            const Image(
              image: AssetImage('assets/images/logo.webp'),
              width: 80,
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                const SizedBox(
                  height: 28,
                ),
                TextFieldInput(
                  controller: emailController,
                  hintText: 'Email',
                  ispassword: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  controller: passwordController,
                  hintText: 'Password',
                  ispassword: !_passwordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    alignment: Alignment.bottomLeft,
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthMethods()
                          .login(
                              email: emailController.text,
                              password: passwordController.text)
                          .then((value) => {
                                if (value == "Success")
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Login Success"),
                                      ),
                                    )
                                  }
                              });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(218, 226, 37, 24),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('forgot your login details? '),
                    Text(
                      'Get help logging in.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Flexible(flex: 0, child: Container()),
                const SizedBox(height: 24),
                const Divider(thickness: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(218, 226, 37, 24),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Flexible(child: Divider(thickness: 2)),
                    Text(" OR "),
                    Flexible(child: Divider(thickness: 2)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                        "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png",
                        width: 40,
                        height: 40),
                    const Text("Sign in with Google")
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
