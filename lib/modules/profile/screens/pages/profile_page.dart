import 'package:beliinini_app/packages/packages.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 16),
              Text(
                'Test',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '081234567890',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              ProfileOption(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () {
                  SharedPreference.clearAuthToken();
                  Navigator.of(context).pushReplacementNamed(LoginPage.route);
                },
                trailing: const SizedBox.shrink(),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
