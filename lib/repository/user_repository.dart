import '../models/user.dart';

class UserRepository {
  // fake database
  final Map<String, User> users = {
    "1": User(id: "1", role: "Admin", joinDate: "2026"),
  };

  bool validateLogin(String email, String password) {
    return email == "amaninourhane@gmail.com" && password == "12345678";
  }

  User getUser(String id) {
    return users[id]!;
  }
}