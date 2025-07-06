import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/ui/main/bloc/main_bloc.dart';
import 'package:main/ui/main/main_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://fyfaibowemoaffxbcllp.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ5ZmFpYm93ZW1vYWZmeGJjbGxwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE2NTI4MzcsImV4cCI6MjA2NzIyODgzN30.j7hUt_EVeVPbzUwflAgOyF-93ZgeT6QULlAYqxLbWNY',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
          create: (_) => MainBloc(), // initial event
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const MainScreen(),
      ),
    );
  }
}
