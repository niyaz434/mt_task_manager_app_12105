import 'package:flutter/material.dart';
import 'package:mt_task_manager_app_12105/screens/login_screen.dart';
import 'package:mt_task_manager_app_12105/screens/task_screen.dart';
import 'services/back4app_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Back4AppService.init();
  final user = await Back4AppService.currentUser();
  runApp(TaskManagerApp(startScreen: user != null ? TasksScreen() : LoginScreen()));
}

class TaskManagerApp extends StatelessWidget {
  final Widget startScreen;
  const TaskManagerApp({required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager App',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: startScreen,
    );
  }
}
