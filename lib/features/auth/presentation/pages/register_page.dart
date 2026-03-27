import 'package:flutter/material.dart';
import '../../data/repositories/auth_repository.dart';

class RegisterPage extends StatelessWidget {

  RegisterPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthRepository authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),

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
              child: const Text("Create Account"),
              onPressed: () async {

                await authRepository.register(
                  emailController.text,
                  passwordController.text,
                );

                if (!context.mounted) return;
                Navigator.pop(context);
              },
            )

          ],
        ),
      ),
    );
  }
}
