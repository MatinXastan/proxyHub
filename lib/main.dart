import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_fast_telegram/constants/colors.dart';
import 'package:proxy_fast_telegram/main_screen.dart';
import 'package:proxy_fast_telegram/screens/proxy_list/proxy_list_screen.dart';
import 'package:proxy_fast_telegram/services/nav_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: AppColors.darkBackgroundDeep,
          appBarTheme: AppBarThemeData(
            backgroundColor: AppColors.darkBackgroundDeep,
            foregroundColor: AppColors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.royalBlue,
              foregroundColor: AppColors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(52),
              ),
            ),
          ),
        ),
        home: MainScreen(),
      ),
    );
  }
}
