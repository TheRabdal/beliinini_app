import 'package:beliinini_app/packages/packages.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  String _username = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    _usernameController.text = 'donero';
    _passwordController.text = 'ewedon';
    _username = _usernameController.text;
    _password = _passwordController.text;

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80),
            const Text(
              'Selamat Datang!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Masuk untuk melanjutkan',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 48),
            LoginTextField(
              controller: _usernameController,
              labelText: 'Nama Pengguna',
              prefixIcon: Icons.person_outline,
            ),
            const SizedBox(height: 16.0),
            LoginTextField(
              controller: _passwordController,
              labelText: 'Kata Sandi',
              prefixIcon: Icons.lock_outline,
              obscureText: _obscureText,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            const SizedBox(height: 32.0),
            LoginButton(username: _username, password: _password),
          ],
        ),
      ),
    );
  }
}
