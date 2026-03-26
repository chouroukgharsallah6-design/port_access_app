import 'package:flutter/material.dart';
import '../../data/repositories/auth_repository.dart';
import 'register_page.dart';
import '../../../access_request/presentation/pages/client_dashboard.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthRepository authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),

            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Login"),
              onPressed: () async {

                await authRepository.login(
                  emailController.text,
                  passwordController.text,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ClientDashboard(),
                  ),
                );
              },
            ),

            TextButton(
              child: const Text("Create account"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RegisterPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}