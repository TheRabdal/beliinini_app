import 'package:beliinini_app/packages/packages.dart';

class FeaturedApisSection extends StatelessWidget {
  const FeaturedApisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Fitur Pilihan',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            children: [
              FeaturedApiItem(
                icon: Icons.menu_sharp,
                name: 'Menu',
                onTap: () {},
              ),
              FeaturedApiItem(
                icon: Icons.airline_seat_individual_suite_sharp,
                name: 'Profile',
                onTap: () {},
              ),
              FeaturedApiItem(
                icon: Icons.details,
                name: 'Detail',
                onTap: () {},
              ),
              FeaturedApiItem(
                icon: Icons.logo_dev, 
                name: 'Logout', 
                onTap: () {
                  SharedPreference.clearAuthToken();
                  Navigator.of(context).pushReplacementNamed(LoginPage.route);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
