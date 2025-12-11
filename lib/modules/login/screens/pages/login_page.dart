import 'package:beliinini_app/packages/packages.dart';

class LoginPage extends StatelessWidget {
  static const route = '/loginpage';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginButtonBloc(LoginService()),
      child: const Scaffold(body: LoginForm()),
    );
  }
}
