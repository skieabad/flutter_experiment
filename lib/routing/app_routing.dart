import 'package:flutter_experiment/pages/go_route/details_page.dart';
import 'package:flutter_experiment/pages/go_route/home_page.dart';
import 'package:flutter_experiment/pages/go_route/not_found_page.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { home, details }

final goRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: AppRoute.home.name,
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: "details/:name/:vehicleName",
          name: AppRoute.details.name,
          builder: (context, state) {
            final name = state.pathParameters["name"] ?? "";
            final vehicleName = state.pathParameters["vehicleName"] ?? "";

            return DetailsPage(name: name, vehicleName: vehicleName);
          },
        ),
      ],
    ),
  ],
  // NOTE: GoRouter error handling applicable only in Web, however in Android or iOS it will display the error on the debug console if you're using Vscode
  errorBuilder:
      (context, state) => NotFoundPage(error: state.error?.message ?? ""),
);
