import 'package:beliinini_app/packages/packages.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  static const String route = 'splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> checkToken() async {
    final token = SharedPreference.getAuthToken();
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    if (token != null) {
      Navigator.pushReplacementNamed(context, MainPage.route, arguments: '');
    } else {
      Navigator.pushReplacementNamed(context, OnboardingPage.route);
    }
  }

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/beliinini.gif',
              width: 500,
              height: 500,
            ),
            SizedBox(height: 16.0),
            Text('Memuat...', style: TextStyle(fontSize: 24.0)),
          ],
        ),
      ),
    );
  }
}
