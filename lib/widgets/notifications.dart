import 'package:flutter/material.dart';
import '../models/notifications.dart';

class AllNotifs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Notif> listOfNotif = NotificationsList().items;
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: listOfNotif.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return OneNotif(listOfNotif[index]);
                }),
          )
        ],
      ),
    );
  }
}

class OneNotif extends StatefulWidget {
  final Notif oneNotif;

  OneNotif(this.oneNotif);

  @override
  _OneNotifState createState() => _OneNotifState();
}

class _OneNotifState extends State<OneNotif> {
  var _expanded = false;
  var width = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 8, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text(widget.oneNotif.title),
              subtitle: Text(widget.oneNotif.description),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                  width = width == 20 ? 0 : 20;
                });
              },
              trailing: IconButton(
                icon: _expanded
                    ? Icon(Icons.expand_less)
                    : Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                    width = width == 20 ? 0 : 20;
                  });
                },
              ),
            ),
            if (_expanded)
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 5.0, left: 15.0, right: 15.0),
                child: const Divider(
                  thickness: 1,
                  color: Colors.black,
                  height: 5,
                ),
              ),
            if (_expanded)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.oneNotif.moreText,
                  textAlign: TextAlign.left,
                ),
              ),
          ],
        ));
  }
}



/*        children: [
          ...listOfNotif.map(
            (item) => Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: ListTile(
                onTap: () {},
                title: Text(item.title),
              ),
            ),
          ),
        ], */