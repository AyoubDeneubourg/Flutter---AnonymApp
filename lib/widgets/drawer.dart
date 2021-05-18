import 'package:flutter/material.dart';
import '../providers/userData.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  bool isSelected = false;
  Color color = Colors.black;
  Widget build(BuildContext context) {
    User user = Provider.of<UserData>(context).getUser;
    print("aaaa");
    print(user.currentFirstName);
    print("aaaa");
    return Drawer(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 22.0),
                color: Color.fromRGBO(0, 74, 124, 1),
                height: 160,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        radius: 45.0,
                        backgroundImage:
                            NetworkImage('https://placekitten.com/200/200'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Container(
                        height: 150,
                        width: 200,
                        child: Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            splashColor: Colors.blue,
                            child: ListTile(
                              title: Text(
                                user.currentFirstName.toString() +
                                    " " +
                                    user.currentLastName.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              subtitle: Text(user.school.toString(),
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        )),
                    Divider(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Navigator.of(context).pushNamed('/edit-screen');
                    },
                    child: ListTile(
                      enabled: false,
                      //   tileColor: Colors.blue,
                      selectedTileColor: Colors.blue,
                      title:
                          Text("Edit profile", style: TextStyle(color: color)),
                      leading: Icon(Icons.edit),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                child: Divider(
                  height: 0,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),
              Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    Provider.of<Auth>(context, listen: false).logout(context);
                  },
                  title: Text("Log out"),
                  leading: Icon(Icons.logout),
                ),
              ),
            ],
          ),
        ),
        elevation: 5);
  }
}
