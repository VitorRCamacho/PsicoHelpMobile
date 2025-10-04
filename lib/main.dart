import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mente_ifc/core/routes.dart';
import 'package:mente_ifc/core/app_router.dart';

void main() => runApp(const MenteIFCApp());

class MenteIFCApp extends StatelessWidget {
  const MenteIFCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mente IFC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.baloo2TextTheme(),
      ),
      initialRoute: Routes.home,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
