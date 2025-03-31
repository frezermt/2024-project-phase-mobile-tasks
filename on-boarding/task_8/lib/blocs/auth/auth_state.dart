part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String email;
  final String password;
  final bool showPassword;

  const AuthSuccess({
    required this.email,
    required this.password,
    this.showPassword = false,
  });

  @override
  List<Object> get props => [email, password, showPassword];
}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error);

  @override
  List<Object> get props => [error];
}