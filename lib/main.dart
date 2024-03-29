import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerse/pages/home/home.dart';
import 'package:flutter_ecommerse/pages/pages.dart';
import 'package:flutter_ecommerse/providers/provider.dart';
import 'package:flutter_ecommerse/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: ((context) => CartProvider()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart-page': (context) => CartPage()
        },
        home: isviewed != 0 ? OnBoard() : Wrapper(),
      ),
    );
  }
}
