import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
/*   final String title;
  ProductDetailScreen(this.title); */

  static const routeName = '/search';
  @override
  Widget build(BuildContext context) {
    // final productId = ModalRoute.of(context).settings.arguments; // as String;
    return Container(
     
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child:
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextFormField( 
                  decoration: InputDecoration(
                  labelText: 'Search something here',
                  border: InputBorder.none,
                  fillColor: Colors.grey[300],
                  filled: true),
                          ),
              ),
                        ),

                       IconButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () => {},
                      icon: Icon(
                        Icons.search,
                      ),
                      
                    ),



            ],
          ),
                         
 Expanded(
   child: Container(
                              
margin: EdgeInsets.symmetric(horizontal: 15),

                              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(5))),
                              child:
                             Center(child: Text("Here is your result"),),),
 )
        ],
        
      ),
      
    );
  }
}
