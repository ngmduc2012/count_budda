import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Giao diện các nút bầm +/-1 +/-5 +/-10

double reSide = 50;
class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return  Center(
      child: Card(
        color: Colors.red,
        child: SizedBox(
          width: 300 - reSide,
          height: 100,
          child: const Center(
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
    return Center(
      child: Card(
        elevation: 0,
        color: Colors.yellow,
        child: SizedBox(
          width: 300 - reSide,
          height: 100,
          child: const Center(
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
        child:  SizedBox(
          width: 300 - reSide,
          height: 100,
          child: const Center(
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
