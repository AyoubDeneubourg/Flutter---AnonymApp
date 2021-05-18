
import 'package:flutter/material.dart';
import 'package:AnonymApp/providers/categories.dart' as he;
import 'package:AnonymApp/screens/category_list_screen.dart';
import 'package:provider/provider.dart';
import '../models/categories.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List<Category> _items = Categories().items;
  List newRooms = [];
  bool loaded = true;
  String user;

  void changeS() {
    setState(() {});
  }

  @override
  void initState() {
    changeS();
    setState(() {
      loaded = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _colors = [
      [const Color(0XFF64E8DE), const Color(0xFF8A64EB)],
      [const Color(0xFFD775FF), const Color(0xFFFFBC75)],
      [const Color(0xFFFFCDA5), const Color(0xFFEE4D5F)],
      [const Color(0xFFFF9482), const Color(0xFF7D77FF)],
      [const Color(0xFF696D78), const Color(0xFF3A3790)],
      [const Color(0xFFB29A00), const Color(0xFFFDD70E)],
      [const Color(0xFFFF7500), const Color(0xFFDC033A)],
      [const Color(0XFFFFCF1B), const Color(0xFFFF881B)],
      [const Color(0xFFF00B51), const Color(0xFF7366FF)],
      [const Color(0xFF6BB6B1), const Color(0xFF65F2A3)],
      [const Color(0xFF7FF7B4), const Color(0xFF3DC27C)],
      [const Color(0xFFA8E349), const Color(0xFF569E20)],
    ];
    newRooms = Provider.of<he.AllCategories>(context).getNewRooms;
    //print(newRooms);
    var isLoading = false;

    // print(newRooms);
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: loaded
          ? Text('loading')
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, // maximum width and try to pass
                childAspectRatio: 3 / 2, // for 200 width, I want 300 height
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              padding: EdgeInsets.all(25),
              itemCount: newRooms.length,
              itemBuilder: (ctx, i) {
                return isLoading
                    ? Text("no")
                    : InkWell(
                        splashColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              CategoryList.routeName,
                              arguments: newRooms[i]);

                          print('tapp');
                        },
                        child: Container(
                          child: Text(newRooms[i]['categoryName'],
                              style: Theme.of(context).textTheme.headline6),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                _colors[i][0].withOpacity(1),
                                _colors[i][1].withOpacity(0.9)
                                //  Color(0xFFD775FF)

                                //   Color(0xFFFFBC75)),
                                //  Color.fromRGBO(255, 188, 117, 1)
                                ///     .withOpacity(0.9),
                              ],
                              begin: i % 2 == 0
                                  ? Alignment.topLeft
                                  : Alignment.bottomRight,
                              end: i % 2 == 0
                                  ? Alignment.bottomLeft
                                  : Alignment.topRight,
                              stops: [0, 1],
                            ),
                          ),
                        ),
                      );
              },
            ),
    );
  }
}
