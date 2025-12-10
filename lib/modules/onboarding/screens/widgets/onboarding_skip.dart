import 'package:beliinini_app/packages/packages.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
    required int currentPage,
    required PageController pageController,
  }) : _currentPage = currentPage,
       _pageController = pageController;

  final int _currentPage;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => OnboardingDot(index: index, currentPage: _currentPage),
            ),
          ),
          const SizedBox(height: 48),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage < 2) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                _currentPage == 2 ? 'Mulai' : 'Lanjut',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 16),

          if (_currentPage != 2)
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
              child: const Text('Lewati', style: TextStyle(color: Colors.grey)),
            )
          else
            const SizedBox(height: 48),
        ],
      ),
    );
  }
}
