import 'package:flutter/material.dart';
import '../repository/user_repository.dart';

class DashboardPage extends StatelessWidget {
  final String userId;

  DashboardPage({required this.userId});

  final repo = UserRepository();

  @override
  Widget build(BuildContext context) {
    final user = repo.getUser(userId);

    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("User ID: ${user.id}"),
            Text("Role: ${user.role}"),
            Text("Join Date: ${user.joinDate}"),
          ],
        ),
      ),
    );
  }
}