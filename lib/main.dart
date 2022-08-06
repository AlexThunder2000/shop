import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String userList = '';
  List shopList = ['1','2','3'];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.shopping_bag),
              Text('Список покупок'),
              Icon(Icons.shopping_bag),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Text('Додати елемент'),
                  content: TextField(
                    onChanged: (String value){
                      userList = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: (){
                          setState((){
                            shopList.add(userList);
                          });
                          Navigator.of(context).pop();
                        },
                        child:Text('Додати'),
                    )
                  ],
                );
              });

            },
          child: Icon(Icons.add),

        ),

        body: ListView.builder(
          itemCount: shopList.length,
          itemBuilder: (BuildContext context, int index){
              return Dismissible(
                  key: Key(shopList[index]),
                  child: Card(
                    child: ListTile(
                      title: Text(shopList[index]),
                    ),
                  ),
                onDismissed: (direction){
                    setState((){
                      shopList.removeAt(index);
                    });
                },
              );
            },
        ),

      ),

    );
  }
}
