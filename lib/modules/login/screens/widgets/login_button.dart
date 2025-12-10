import 'package:beliinini_app/packages/packages.dart';

class LoginButton extends StatefulWidget {
  final String username;
  final String password;

  const LoginButton({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _isLoading = false;

  void _login(BuildContext context) {
    context.read<LoginBloc>().add(
      LoginButtonPressed(username: widget.username, password: widget.password),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          setState(() {
            _isLoading = true;
          });
        } else if (state is LoginSuccess) {
          setState(() {
            _isLoading = false;
          });
          SharedPreference.setAuthToken(state.data.token!);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login Berhasil!'),
              duration: const Duration(seconds: 2),
            ),
          );
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, MainPage.route);
          });
        } else if (state is LoginFailure) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Terjadi kesalahan: ${state.error}'),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => _login(context),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: _isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text('Masuk', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
