import 'package:flutter/material.dart';
import 'package:AnonymApp/models/categories.dart';
import 'package:AnonymApp/providers/categories.dart';
import 'package:provider/provider.dart';
import '../services/http_exception.dart';

class ChatRoomScreen extends StatelessWidget {
  static String routeName = "/chat-room-screen";

  var arguments;
  ChatRoomScreen(this.arguments);
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _userData = {'message': ''};

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    List messages = Provider.of<AllMessages>(context).getAllMessages;
    Future<void> _submit() async {
      _formKey.currentState.save();

      try {
        // Sign user up
        await Provider.of<AllMessages>(context, listen: false)
            .addMessage(_userData, context);
      } on HttpException catch (error) {
        String e = HttpException(message: error.toString())
            .errorAuthentification(error);
        HttpException().showErrorDialog(e, context);
        return;
      } catch (err) {
        const e = 'Could not authenticate you. Please try again later.';
        HttpException().showErrorDialog(e, context);
        return;
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: Container(
        height: deviceSize.height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (ctx, i) {
                      return Wrap(children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Text(messages[i].toString())),
                      ]);
                    }),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      onSaved: (value) {
                        _userData['message'] = value;
                      },
                      decoration: InputDecoration(
                          labelText: 'Send a message',
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true),
                    ),
                  ),
                ),
                IconButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: _submit,
                  icon: Icon(
                    Icons.send,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
