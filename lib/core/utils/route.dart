import 'package:beliinini_app/packages/packages.dart';

Route<dynamic>? pageRoute(Widget page) {
  return MaterialPageRoute(builder: (_) => page);
}

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case SplashPage.route:
        return pageRoute(const SplashPage());

      case LoginPage.route:
        return pageRoute(const LoginPage());

      case OnboardingPage.route:
        return pageRoute(const OnboardingPage());

      case DashboardHomePage.route:
        return pageRoute(const DashboardHomePage());

      case MainPage.route:
        return pageRoute(MainPage());

      case ProductDetailPage.route:
        if (args is ScreenArguments) {
          return pageRoute(ProductDetailPage(productId: args.productId ?? ''));
        }
        return pageRoute(const NotFoundPage());

      default:
        return pageRoute(const NotFoundPage());
    }
  }
}
