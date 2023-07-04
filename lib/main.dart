import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_sphere_admin/application/add_brand/add_brand_image_notifier.dart';
import 'package:sole_sphere_admin/application/add_product/add_size_notifier.dart';
import 'package:sole_sphere_admin/application/add_product/brand_selection_notifier.dart';
import 'package:sole_sphere_admin/presentation/home_screens/home_screen.dart';
import 'package:sole_sphere_admin/presentation/splash_screen/splash_screen.dart';

void main(List<String> args) {
  runApp(SoleSphereAdmin());
}

class SoleSphereAdmin extends StatelessWidget {
  const SoleSphereAdmin({super.key});
  final MaterialColor black = const MaterialColor(0xFF000000, <int, Color>{
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF5F5F5),
    200: Color(0xFFEEEEEE),
    300: Color(0xFFE0E0E0),
    400: Color(0xFFBDBDBD),
    500: Color(0xFF9E9E9E),
    600: Color(0xFF757575),
    700: Color(0xFF616161),
    800: Color(0xFF424242),
    900: Color(0xFF212121),
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddBrandImageNotifier>(
          create: (context) => AddBrandImageNotifier(),
        ),
        ChangeNotifierProvider<BrandSelectionNotifier>(
          create: (context) => BrandSelectionNotifier(),
        ),
       
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: black),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
