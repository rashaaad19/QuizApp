import 'package:flutter/material.dart';
import 'package:quizapp/globals.dart';
import 'package:quizapp/screens/category_screen.dart';

final _formkey = GlobalKey<FormState>();




class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  // Name: Starts with capital, contains at least one number, allows letters and spaces
  final nameRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]+$');
  // Password: At least 1 uppercase, 1 lowercase, 1 digit, 1 special char, min 8 chars
  final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$',
  );

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.orangeAccent),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 150),
            Image.asset(
              'assets/pngtree-illustration-of-monsters-inc-characters-png-image_12849244.png',
              width: 150,
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 20,
                            ),
                            contentPadding: const EdgeInsets.only(top: 12),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                            ),

                            hintText: 'Username',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            if (!widget.nameRegex.hasMatch(value)) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                showDialog(
                                  context: context,
                                  builder:
                                      (_) => AlertDialog(
                                        title: Text('Username Requirements'),
                                        content: Text(
                                          'Must start with a capital letter and contain at least one number',
                                        ),
                                      ),
                                );
                              });
                              return '!';
                            }
                            AppGlobals.userName = value;
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.grey,
                              size: 20,
                            ),
                            suffixIcon: const Icon(Icons.visibility_off),
                            contentPadding: const EdgeInsets.only(
                              left: 8,
                              top: 12,
                              bottom: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: 'Password',
                          ),

                          //Validation
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            if (!widget.passwordRegex.hasMatch(value)) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                showDialog(
                                  context: context,
                                  builder:
                                      (_) => AlertDialog(
                                        title: Text('Password Requirements'),
                                        content: Text(
                                          '1 uppercase, 1 lowercase, 1 number, 1 special char, 8+ chars',
                                        ),
                                      ),
                                );
                              });
                              return '!';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text("New to quizz app?"),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.orange[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(180, 50),
                          backgroundColor: Colors.orange[800],
                          foregroundColor: Colors.white,
                          shape: const StadiumBorder(),
                          shadowColor: Colors.black,
                          elevation: 5,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 25),
                      Icon(
                        Icons.fingerprint,
                        size: 75,
                        color: Colors.lightBlue[400],
                      ),
                      const SizedBox(height: 7),
                      Text(
                        'Use Touch ID',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (v) {
                                  setState(() {
                                    rememberMe = v!;
                                  });
                                },
                                activeColor: Colors.orange,
                              ),
                              const Text(
                                'Remember Me',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.orange[800]),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
