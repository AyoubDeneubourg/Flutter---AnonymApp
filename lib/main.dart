import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:AnonymApp/providers/categories.dart';
import 'package:provider/provider.dart';
import 'package:AnonymApp/screens/edit_profile_screen.dart';
import 'providers/auth.dart';
import 'providers/userData.dart';
import 'screens/category_list_screen.dart';
import 'screens/chat_room_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login/welcome_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/search_screen.dart';

import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:firebase_core/firebase_core.dart';

import 'widgets/drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const MaterialColor kPrimaryColor = const MaterialColor(
    0xFF004A7F,
    const <int, Color>{
      50: const Color(0xFF004A7F),
      100: const Color(0xFF004A7F),
      200: const Color(0xFF004A7F),
      300: const Color(0xFF004A7F),
      400: const Color(0xFF004A7F),
      500: const Color(0xFF004A7F),
      600: const Color(0xFF004A7F),
      700: const Color(0xFF004A7F),
      800: const Color(0xFF004A7F),
      900: const Color(0xFF004A7F),
    },
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Auth(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => UserData(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => AllCategories(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => AllMessages(),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'AnonymApp',
            theme: ThemeData(
                primarySwatch: kPrimaryColor,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                brightness: Brightness.light),
     /*        darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.orange,
                primaryColor: Colors.orange), */
            home: FirebaseAuth.instance.currentUser != null
                ? MyHomePage(title: 'AnonymApp')
                : WelcomePage(),
            onGenerateRoute: (RouteSettings settings) {
              var routes = <String, WidgetBuilder>{
                CategoryList.routeName: (ctx) =>
                    CategoryList(settings.arguments),
                ChatRoomScreen.routeName: (ctx) =>
                    ChatRoomScreen(settings.arguments),
              };
              WidgetBuilder builder = routes[settings.name];
              return MaterialPageRoute(builder: (ctx) => builder(ctx));
            },
            routes: {
              NotifPage.routeName: (ctx) => NotifPage(),
              EditProfileScreen.routeName: (ctx) => EditProfileScreen(),
            },
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Provider.of<UserData>(context, listen: false)
        .getUserData(FirebaseAuth.instance.currentUser.email)
        .then((_) {});
    print(FirebaseAuth.instance.currentUser.email);
    Provider.of<AllCategories>(context, listen: false)
        .getCategories()
        .then((_) {});
    Provider.of<AllMessages>(context, listen: false).getMessages().then((_) {});

    super.initState();
  }

  Color selectedColor = Colors.red;
  SnakeShape snakeShape = SnakeShape.circle;

  int _selectedItemPosition = 1;

  Color containerColor;
  List<Color> containerColors = [
    Color.fromRGBO(250, 251, 255, 0.0),
    Color.fromRGBO(250, 251, 253, 0.0),
    Color.fromRGBO(250, 251, 253, 0.0),
  ];

  @override
  Widget build(BuildContext context) {
    print(widget.title);
    final deviceSize = MediaQuery.of(context).size;
    List<Widget> _children = [
      NotifPage(),
      HomePage(),
      SearchPage(),
    ];
    print("noww");
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      bottomNavigationBar: SnakeNavigationBar.color(
        // height: 10, // height of elements
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: snakeShape,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: EdgeInsets.all(8),

        snakeViewColor: Color.fromRGBO(34, 34, 34, 1),
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.grey,

        showUnselectedLabels: false,
        showSelectedLabels: false,

        currentIndex: _selectedItemPosition,
        onTap: (index) => {
          setState(
            () {
              containerColor = containerColors[index];
              _selectedItemPosition = index;
            },
          ),
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'tickets'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        ],
      ),
      endDrawer: AppDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedContainer(
        color: containerColor ?? containerColors[0],
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 250),
        child: Container(
          width: deviceSize.width,
          child: _children[_selectedItemPosition],
        ),
      ),
    );
  }
}
