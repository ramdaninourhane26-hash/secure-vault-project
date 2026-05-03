import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/user_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository repo;

  AuthBloc(this.repo) : super(AuthInitial()) {
    on<LoginSubmitted>(_login);
  }

  void _login(LoginSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    await Future.delayed(Duration(seconds: 1));

    // validation
    if (!event.email.contains("@")) {
      emit(AuthError("Invalid email"));
      return;
    }

    if (event.password.length < 8) {
      emit(AuthError("Password must be 8+ chars"));
      return;
    }

    // check login
    if (repo.validateLogin(event.email, event.password)) {
      emit(AuthSuccess("1")); // user id
    } else {
      emit(AuthError("Wrong credentials"));
    }
  }
}