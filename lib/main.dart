import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class TodoItem {
  String text;
  TodoItem(this.text);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoItem> todos = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFFD3E0),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'New task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.purple, width: 2.0),

                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      setState(() {
                        todos.add(TodoItem(controller.text));
                        controller.clear();
                      });
                    }
                  },
                  child: Icon(Icons.add,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Buton rengi
                  ),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      todos.clear();
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // İçeriği ortala
                    children: [
                      Text(
                        'Remove All',
                        style: TextStyle(color: Colors.white, fontSize: 17), // Text rengi beyaz
                      ),
                      SizedBox(width: 5),

                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Buton rengi
                  ),
                ),
                SizedBox(height: 20), // Boşluk ekleyen SizedBox
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 42.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(18.0), // Border radius
                      ),
                  margin: EdgeInsets.symmetric(horizontal: 2.0,vertical: 6.0),
                  child: ListTile(
                    title: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(todos[index].text),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                    ),
                  ),);

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
