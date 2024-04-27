import 'package:app/features/AddShip/presentation/views/add_ship.dart';
import 'package:app/features/AddTrip/presentation/views/add_trip.dart';
import 'package:app/features/Dashboard/presenation/views/dashboard.dart';
import 'package:app/features/Login/presentation/views/login_form.dart';
import 'package:app/features/Login/presentation/views/login_splach.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  print(token);
  runApp(ProviderScope(child: MyApp(token: token)));
}

class MyApp extends StatelessWidget {
  final token;
  const MyApp({
    @required this.token,
    Key? key,
  }) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: (token != '') ? '/' : '/splash',
      routes: {
        '/splash': (context) => const LoginSplash(),
        '/login_form': (context) => const LoginForm(),
        '/': (context) => const Dashboard(),
        '/add_ship': (context) => const AddShip(),
        '/add_trip': (context) => const AddTrip()
      },
    );
  }
}
