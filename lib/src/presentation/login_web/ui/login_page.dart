import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/state_management/login_controller/auth_controller.dart';

class LoginPageDemo extends StatelessWidget {
  LoginPageDemo({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Username field
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
                validator: (input) => input != null && input.isValidUsername()
                    ? null
                    : "Please enter a valid email address",
              ),
              const SizedBox(height: 16),

              // Password field
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (input) => input != null && input.isValidPassword()
                    ? null
                    : "Password must be at least 8 characters long",
              ),
              const SizedBox(height: 20),

              // Login button with loading
              Obx(() {
                if (authController.isLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If form is valid, attempt login
                        authController.login(
                          usernameController.text,
                          passwordController.text,
                        );
                      }
                    },
                    child: const Text("Login"),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// Extension for validation
extension UsernameValidator on String {
  bool isValidUsername() {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return this.length >= 8; // Adjust as per your password rules
  }
}
