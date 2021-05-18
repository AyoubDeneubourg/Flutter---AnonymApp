import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  // Receive a List
  final oneCategory;
  Category(this.oneCategory);

  Map get getOneCategory {
    return {
      "categoryName": this.oneCategory['CategoryName'],
      "rooms": this.oneCategory['Rooms']
    };
  }

  List rooms = [
    {
      'roomName': "FIRST ROOM",
      'messages': [
        {
          'username': 'Miniaa',
          'message': 'Premier message room 1',
          'date': DateTime.now().toIso8601String(),
        },
        {
          'username': 'Miniaaa',
          'message': '2 eme message room 1',
          'date': DateTime.now().toIso8601String(),
        }
      ]
    },
    {
      'roomName': "SECOND ROOM",
      'messages': [
        {
          'username': 'Lukas',
          'message': 'Premier message ROOM 2',
          'date': DateTime.now().toIso8601String(),
        }
      ]
    }
  ];

/*   Map get oneCategory {
    return {
      'categoryId': "",
      'categoryName': "",
      'rooms': [getOneCategory],
    };
  } */
}

class Rooms {
  // Receive RoomID, name & an array of maps of arrays
  List<Map> rooms;
  Rooms(oneRoom);

  String get getRoomId {
    return roomID.toString();
  }

  Map get oneRoom {
    if (rooms != null) {
      rooms.forEach((element) {
        return {'roomName': element['roomName'], 'messages': {}};
      });
    }
  }

  String roomID = " a";
  String roomName = "";
  List messages = [
    {
      'username': '',
      'message': '',
      'date': '',
    }
  ];
}

class AllCategories with ChangeNotifier {
  DocumentSnapshot currentDocumentSnapshots;
  var newRooms = [];

  List get getNewRooms {
    return newRooms;
  }

  List rooms = [
    {
      'roomName': "FIRST ROOM",
      'messages': [
        {
          'username': 'Miniaa',
          'message': 'Premier message room Five',
          'date': DateTime.now().toIso8601String(),
        },
        {
          'username': 'Miniaaa',
          'message': '2 eme message room Five',
          'date': DateTime.now().toIso8601String(),
        }
      ]
    },
    {
      'roomName': "SECOND ROOM",
      'messages': [
        {
          'username': 'Lukas',
          'message': 'Premier message ROOM Five',
          'date': DateTime.now().toIso8601String(),
        }
      ]
    }
  ];

  Future<void> getCategories() async {
    FirebaseFirestore.instance
        .collection('categories')
        .snapshots()
        .listen((QuerySnapshot documentSnapshot) {
      newRooms = [];
      documentSnapshot.docs.forEach((element) {
        var r = element.data();
        newRooms.add(Category(r).getOneCategory);
        // print(Category(r).getOneCategory);
      });
      notifyListeners();
    });
  }

  Future<void> addCategory() async {
    String Category = 'Category';
    String number = 'twelve';
    FirebaseFirestore.instance.collection('categories')
      ..doc('$Category$number').set({
        'CategoryName': '$Category $number',
        'Rooms': [...rooms]
      });
  }
}

class AllMessages with ChangeNotifier {
  var allMessages = [];

  List get getAllMessages {
    return allMessages;
  }

  Future<void> getMessages() async {
    FirebaseFirestore.instance
        .collection('messages')
        .snapshots()
        .listen((QuerySnapshot documentSnapshot) {
      documentSnapshot.docs.forEach((element) {
        var r = element.data();
        allMessages = [];
        allMessages = [...r['room1']];
      });
      notifyListeners();
    });
  }

  Future<void> addMessage(Map userData, BuildContext context) async {
    print(userData);
    try {
      await FirebaseFirestore.instance
          .collection("messages")
          .doc('allMessages')
          .update({
        'room1': FieldValue.arrayUnion([userData['message']]),
      }).whenComplete(() {
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
  }
}
