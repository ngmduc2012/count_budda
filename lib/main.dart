import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:developer' as d;


Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '卍',
      ///Giao diện tối.
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: '卍 A Di Đà Phật'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /// Tính số lần niệm Phật
  int _counter = 0;
  int _a_di_da_phat = 0;

  void _incrementCounter(int number) {
    if (number > 0) {
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
  final ADIDAPHAT = "ADIDAPHAT";
  final COUNT = "COUNT";

  Future<void> _saveData() async {
    setState(() {
      _a_di_da_phat += _counter;
      storage.write(ADIDAPHAT, _a_di_da_phat);
      _counter = 0;
      storage.write(COUNT, _counter);
    });
  }

  /// Nhận diện giọng nói - Nam Mô A Di Đà Phật
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(
        cancelOnError: false,
        listenMode: ListenMode.confirmation,
        // listenFor: const Duration(minutes:  10),
        pauseFor: const Duration(seconds:  10),
        // partialResults: true,
        localeId: 'vi',
        onResult: (val) => setState(() {
              _lastWords = val.recognizedWords;
              check(val.recognizedWords);
            }));
    setState(() {

    });
  }

  check( String word){
    if(_speechToText.isNotListening){
      if(word.contains("A Di Đà")){
        _incrementCounter(1);
      }
      _startListening();
    }

    // d.log("isNotListening: " + _speechToText.isNotListening.toString());
    // d.log("isAvailable: " + _speechToText.isAvailable.toString());
    // d.log("isListening: " + _speechToText.isListening.toString());
    // d.log("hasRecognized: " + _speechToText.hasRecognized.toString());
    // d.log("lastStatus: " +  _speechToText.lastStatus.toString());
    // d.log("=====================");
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// Init

  @override
  void initState() {
    _initSpeech();
    _a_di_da_phat = storage.read(ADIDAPHAT) ?? 0;
    _counter = storage.read(COUNT) ?? 0;
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  /// Giao diện

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          GestureDetector(
            onTap: () {
              HapticFeedback.mediumImpact();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Nếu niệm Phật không có tác dụng thì niệm: NA TA SE RA"),
              ));
            },
            child: const Icon(
              Icons.lock,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          GestureDetector(
            onTap: () {
              myController.clear();
              _saveData();
            },
            child: const Icon(
              Icons.verified,
              color: Colors.green,
            ),
          ),
          const SizedBox(
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
            height: 72,
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
                      children: const [
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
                'Nam Mô A Di Đà Phật',
              ),
              Text(
                // If listening is active show the recognized words
                _speechToText.isListening
                    ? '$_lastWords'
                // If listening isn't active but could be tell the user
                // how to start it, otherwise indicate that speech
                // recognition is not yet ready or not supported on
                // the target device
                    : _speechEnabled
                    ? ''
                    : 'Speech not available',
              ),
            ],
          ),
          const SizedBox(
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
              const SizedBox(
                width: 4,
              ),
              Flexible(
                child: TextField(
                  controller: myController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a number',
                  ),
                ),
              ),
              const SizedBox(
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
                      child: const Text("+"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            // If not yet listening for speech start, otherwise stop
        _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


///Giao diện các nút bầm +/-1 +/-5 +/-10

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
///
