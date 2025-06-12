import 'package:flutter/material.dart';
import 'package:personal_notes_app/Core/Provider/Auth%20Provider/auth_provider.dart';
import 'package:personal_notes_app/Modules/Home/Screens/home_screen.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://rrflatdxdsoczmsiukst.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJyZmxhdGR4ZHNvY3ptc2l1a3N0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk3MTE2ODIsImV4cCI6MjA2NTI4NzY4Mn0.iGVkX7IeufVJGlUr9U0DuVZsXg_CoVA-REgcmPfqOF4',
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}















//lDn7uE8X5itXEJ1s