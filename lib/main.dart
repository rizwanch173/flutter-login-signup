import 'package:new_app/component/routes.dart';
import 'package:new_app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewAPP',
      theme: AppTheme.apptheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: Routes.route(),
      onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
      //onUnknownRoute: (settings) => Routes.onUnknownRoute(settings),
      initialRoute: "SplashPage",
    );
  }
}
