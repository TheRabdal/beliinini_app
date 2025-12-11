import 'package:beliinini_app/packages/packages.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginButtonBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService _loginService;

  LoginButtonBloc(this._loginService) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final data = await _loginService.login(event.username, event.password);
        emit(LoginSuccess(data: data));
      } catch (e) {
        emit(LoginFailure(error: e.toString()));
      }
    });
  }
}
