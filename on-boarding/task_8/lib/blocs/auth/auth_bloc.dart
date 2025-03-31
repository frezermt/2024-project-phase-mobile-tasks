import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthSuccess(email: '', password: '')) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<AuthState> emit) {
    if (state is AuthSuccess) {
      final currentState = state as AuthSuccess;
      emit(currentState.copyWith(email: event.email));
    }
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    if (state is AuthSuccess) {
      final currentState = state as AuthSuccess;
      emit(currentState.copyWith(password: event.password));
    }
  }

  void _onTogglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<AuthState> emit) {
    if (state is AuthSuccess) {
      final currentState = state as AuthSuccess;
      emit(currentState.copyWith(showPassword: !currentState.showPassword));
    }
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<AuthState> emit) async {
    if (state is! AuthSuccess) return;

    final currentState = state as AuthSuccess;
    emit( AuthLoading());

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      if (currentState.email.isEmpty || currentState.password.isEmpty) {
        emit(const AuthFailure('Please fill all fields'));
      } else {
        emit(currentState);
        // In a real app, you would navigate to home screen here
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _onSignUpSubmitted(SignUpSubmitted event, Emitter<AuthState> emit) async {
    if (state is! AuthSuccess) return;

    final currentState = state as AuthSuccess;
    emit( AuthLoading());

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      if (currentState.email.isEmpty || currentState.password.isEmpty) {
        emit(const AuthFailure('Please fill all fields'));
      } else {
        emit(currentState);
        // In a real app, you would navigate to home screen here
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

extension AuthSuccessCopyWith on AuthSuccess {
  AuthSuccess copyWith({
    String? email,
    String? password,
    bool? showPassword,
  }) {
    return AuthSuccess(
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}