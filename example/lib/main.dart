import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Date Picker Timeline Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _controller.animateToSelection());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () {
            _controller.animateToSelection();
          },
        ),
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Container(
          padding: EdgeInsets.all(0.0),
          // color: Colors.blueGrey[100],
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("You Selected:"),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(_selectedValue.toString()),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                child: DatePicker(
                  DateTime.now().subtract(const Duration(days: 100)),
                  width: 53,
                  height: 102,
                  controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Color.fromRGBO(255, 0, 0, 1),
                  selectedTextColor: Colors.white,
                  // daysCount: 1000,
                  // inactiveDates: [
                  //   DateTime.now().add(Duration(days: 3)),
                  //   DateTime.now().add(Duration(days: 4)),
                  //   DateTime.now().add(Duration(days: 7))
                  // ],
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
