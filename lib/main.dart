import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '卍',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: '卍 A Di Đà Phật'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _a_di_da_phat = 0;

  void _incrementCounter(int number) {
    if(number > 0){
      HapticFeedback.mediumImpact();
    }
    setState(() {
      if (_counter + number >= 0) {
        _counter += number;
        storage.write(COUNT, _counter);
      }
    });
  }

  final storage = GetStorage();
  final  ADIDAPHAT = "ADIDAPHAT";
  final COUNT = "COUNT";
  Future<void> _saveData() async {
    setState(() {
    _a_di_da_phat+= _counter;
    storage.write(ADIDAPHAT, _a_di_da_phat);
    _counter = 0;
    });
  }


  @override
  void initState() {
    _a_di_da_phat = storage.read(ADIDAPHAT)??0;
    _counter = storage.read(COUNT)??0;
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          GestureDetector(
            onTap: () {
              myController.clear();
              _saveData();
            },
            child: Icon(Icons.verified, color: Colors.green,),
          ),
          SizedBox(
            width: 24,
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),

        /// Bug: Vertical viewport was given unbounded height
        /// The following: https://stackoverflow.com/a/54587532/10621168
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 108,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: "$_counter"));
                  HapticFeedback.mediumImpact();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Copied: $_counter "),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '/10000',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: "$_a_di_da_phat"));
                  HapticFeedback.mediumImpact();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Copied: $_a_di_da_phat "),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$_a_di_da_phat',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Text(
                'Nam Mô a Di Đà Phật',
              ),
            ],
          ),
          SizedBox(
            height: 72,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => _incrementCounter(1),
                child: ElevatedCardExample(),
              ),
              GestureDetector(
                onTap: () => _incrementCounter(-1),
                child: ElevatedCardExample2(),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => _incrementCounter(5),
                child: FilledCardExample(),
              ),
              GestureDetector(
                onTap: () => _incrementCounter(-5),
                child: FilledCardExample2(),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => _incrementCounter(10),
                child: OutlinedCardExample(),
              ),
              GestureDetector(
                onTap: () => _incrementCounter(-10),
                child: OutlinedCardExample2(),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 4,
              ),
              Flexible(
                child: TextField(
                  controller: myController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a number',
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[Colors.blue, Colors.blue],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        _incrementCounter(int.parse(myController.value.text));
                      },
                      child: Text("+"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 4,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[Colors.blueGrey, Colors.blueGrey],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        _incrementCounter(-int.parse(myController.value.text));
                      },
                      child: Text("-"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 4,
              ),
            ],
          ),
          SizedBox(
            height: 108,
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        color: Colors.red,
        child: SizedBox(
          width: 300 - 24,
          height: 100,
          child: Center(
              child: Text(
            '+1',
            style: TextStyle(fontSize: 40, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

class FilledCardExample extends StatelessWidget {
  const FilledCardExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        elevation: 0,
        color: Colors.yellow,
        child: SizedBox(
          width: 300 - 24,
          height: 100,
          child: Center(
              child: Text(
            '+5',
            style: TextStyle(fontSize: 40, color: Colors.black),
          )),
        ),
      ),
    );
  }
}

class OutlinedCardExample extends StatelessWidget {
  const OutlinedCardExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.green,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const SizedBox(
          width: 300 - 24,
          height: 100,
          child: Center(
              child: Text(
            '+10',
            style: TextStyle(fontSize: 40, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

class ElevatedCardExample2 extends StatelessWidget {
  const ElevatedCardExample2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        color: Colors.red,
        child: SizedBox(
          width: 100,
          height: 100,
          child: Center(
              child: Text(
            '-1',
            style: TextStyle(fontSize: 40, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

class FilledCardExample2 extends StatelessWidget {
  const FilledCardExample2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        elevation: 0,
        color: Colors.yellow,
        child: SizedBox(
          width: 100,
          height: 100,
          child: Center(
              child: Text(
            '-5',
            style: TextStyle(fontSize: 40, color: Colors.black),
          )),
        ),
      ),
    );
  }
}

class OutlinedCardExample2 extends StatelessWidget {
  const OutlinedCardExample2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.green,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const SizedBox(
          width: 100,
          height: 100,
          child: Center(
              child: Text(
            '-10',
            style: TextStyle(fontSize: 40, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
