
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserNameState {
  DocumentSnapshot data;
}

    /*  Stream users =
        FirebaseFirestore.instance.collection('users').doc("aa").snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: users,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        //   children: snapshot.data.docs.map((DocumentSnapshot document) {
        // return
        return new Drawer(
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
                                    'Ayoub Deneubourg',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                  subtitle: Text(
                                      'Multimedia & Creative Technologies',
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
                          title: Text("Edit profile",
                              style: TextStyle(color: color)),
                          leading: Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0),
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
                ],
              ),
            ),
            elevation: 5);
      },
    ); */
 

