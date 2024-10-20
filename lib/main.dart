import 'package:flutter/material.dart';
import 'package:mobileapp_qa/page/createaccontUser/cteate_accont.dart';
import 'package:mobileapp_qa/provider/admin_provider.dart';
import 'package:provider/provider.dart';
import 'package:mobileapp_qa/screens/user_form_screen.dart'; // Make sure to import the correct path

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AdminProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final adminProvider = Provider.of<AdminProvider>(context, listen: false);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo Home Page')),
        body: UserFormScreen(), // Call UserFormScreen here
      ),
    );
  }
}
