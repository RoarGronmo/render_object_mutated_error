import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  late ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController = ScrollController();

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    var chipKey1 = GlobalKey();
    var chipKey2 = GlobalKey();
    var chipKey3 = GlobalKey();
    var chipKey4 = GlobalKey();
    var chipKey5 = GlobalKey();
    var chipKey6 = GlobalKey();
    var chipKey7 = GlobalKey();
    var chipKey8 = GlobalKey();



    Future futureTask() async {
      await Future.delayed(const Duration(milliseconds: 10));
    }



    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        //
        // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
        // action in the IDE, or press "p" in the console), to see the
        // wireframe for each widget.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 4,
                children: [
                  StreamBuilder(
                      stream: Stream.fromFuture(futureTask()),
                      builder: (context, snapshot) {


                        if(snapshot.hasError){
                          return RawChip(
                            avatar: Icon(Icons.heart_broken),
                            showCheckmark: false,
                            key: chipKey1,
                            label: Text("Error"),
                            deleteIcon: Icon(Icons.warning_amber),
                            onDeleted: (){},
                            deleteButtonTooltipMessage: "Warning",
                          );
                        }

                        if(snapshot.connectionState==ConnectionState.waiting){
                          return RawChip(
                            avatar: Icon(Icons.favorite_outline),
                            key: chipKey1,
                              showCheckmark: false,
                              label: Text("Waiting..."),
                            deleteIcon: Icon(Icons.change_circle_outlined),
                            onDeleted: (){},
                            deleteButtonTooltipMessage: "Waiting...",
                          );
                        }

                        //if(snapshot.connectionState==ConnectionState.done){
                          return RawChip(
                            avatar: Icon(Icons.favorite),
                            key: chipKey1,
                              showCheckmark: false,
                              selected: _counter.isEven,
                              selectedColor: Colors.lightBlue,
                              label:Text('Count: $_counter',),
                            deleteIcon: const Icon(Icons.check_box_outlined),
                            deleteButtonTooltipMessage: "Checked...",
                            onDeleted: (){},
                            onPressed: (){
                              setState(() {
                                _counter = _counter-1;
                              });
                            },
                          );
                        /*
                        }else{
                          return Text("Unknown state=${snapshot.connectionState.name}");
                        }*/

                      }
                  ),
                  StreamBuilder(
                      stream: Stream.fromFuture(futureTask()),
                      builder: (context, snapshot) {

                        if(snapshot.hasError){
                          return RawChip(
                            avatar: Icon(Icons.heart_broken),
                            showCheckmark: false,
                            key: chipKey2,
                            label: Text("Error"),
                          );
                        }

                        if(snapshot.connectionState==ConnectionState.waiting){
                          return RawChip(
                            avatar: Icon(Icons.favorite_outline),
                            key: chipKey2,
                            showCheckmark: false,
                            label: Text("Waiting..."),
                            deleteIcon: Icon(Icons.change_circle_outlined),
                            onDeleted: (){},
                          );
                        }

                        //if(snapshot.connectionState==ConnectionState.done){
                        return RawChip(
                            avatar: Icon(Icons.favorite),
                            key: chipKey2,
                            showCheckmark: false,
                            selected: _counter.isEven,
                            selectedColor: Colors.lightBlue,
                            label:Text('Count: $_counter',)
                        );
                        /*
                        }else{
                          return Text("Unknown state=${snapshot.connectionState.name}");
                        }*/

                      }
                  ),
                  StreamBuilder(
                      stream: Stream.fromFuture(futureTask()),
                      builder: (context, snapshot) {

                        if(snapshot.hasError){
                          return RawChip(
                            avatar: Icon(Icons.heart_broken),
                            showCheckmark: false,
                            key: chipKey3,
                            label: Text("Error"),
                          );
                        }

                        if(snapshot.connectionState==ConnectionState.waiting){
                          return RawChip(
                            avatar: Icon(Icons.favorite_outline),
                            key: chipKey3,
                            showCheckmark: false,
                            label: Text("Waiting..."),
                            deleteIcon: Icon(Icons.change_circle_outlined),
                            onDeleted: (){},
                          );
                        }

                        //if(snapshot.connectionState==ConnectionState.done){
                        return RawChip(
                            avatar: Icon(Icons.favorite),
                            key: chipKey3,
                            showCheckmark: false,
                            selected: _counter.isEven,
                            selectedColor: Colors.lightBlue,
                            label:Text('Count: $_counter',)
                        );
                        /*
                        }else{
                          return Text("Unknown state=${snapshot.connectionState.name}");
                        }*/

                      }
                  ),
                  StreamBuilder(
                      stream: Stream.fromFuture(futureTask()),
                      builder: (context, snapshot) {

                        if(snapshot.hasError){
                          return RawChip(
                            avatar: Icon(Icons.heart_broken),
                            showCheckmark: false,
                            key: chipKey4,
                            label: Text("Error"),
                          );
                        }

                        if(snapshot.connectionState==ConnectionState.waiting){
                          return RawChip(
                            avatar: Icon(Icons.favorite_outline),
                            key: chipKey4,
                            showCheckmark: false,
                            label: Text("Waiting..."),
                            deleteIcon: Icon(Icons.change_circle_outlined),
                            onDeleted: (){},
                          );
                        }

                        //if(snapshot.connectionState==ConnectionState.done){
                        return RawChip(
                            avatar: Icon(Icons.favorite),
                            key: chipKey4,
                            showCheckmark: false,
                            selected: _counter.isEven,
                            selectedColor: Colors.lightBlue,
                            label:Text('Count: $_counter',)
                        );
                        /*
                        }else{
                          return Text("Unknown state=${snapshot.connectionState.name}");
                        }*/

                      }
                  ),
                  StreamBuilder(
                      stream: Stream.fromFuture(futureTask()),
                      builder: (context, snapshot) {

                        if(snapshot.hasError){
                          return RawChip(
                            avatar: Icon(Icons.heart_broken),
                            showCheckmark: false,
                            key: chipKey5,
                            label: Text("Error"),
                          );
                        }

                        if(snapshot.connectionState==ConnectionState.waiting){
                          return RawChip(
                            avatar: Icon(Icons.favorite_outline),
                            key: chipKey5,
                            showCheckmark: false,
                            label: Text("Waiting..."),
                            deleteIcon: Icon(Icons.change_circle_outlined),
                            onDeleted: (){},
                          );
                        }

                        //if(snapshot.connectionState==ConnectionState.done){
                        return RawChip(
                            avatar: Icon(Icons.favorite),
                            key: chipKey5,
                            showCheckmark: false,
                            selected: _counter.isEven,
                            selectedColor: Colors.lightBlue,
                            label:Text('Count: $_counter',)
                        );
                        /*
                        }else{
                          return Text("Unknown state=${snapshot.connectionState.name}");
                        }*/

                      }
                  ),
                  StreamBuilder(
                      stream: Stream.fromFuture(futureTask()),
                      builder: (context, snapshot) {

                        if(snapshot.hasError){
                          return RawChip(
                            avatar: Icon(Icons.heart_broken),
                            showCheckmark: false,
                            key: chipKey6,
                            label: Text("Error"),
                          );
                        }

                        if(snapshot.connectionState==ConnectionState.waiting){
                          return RawChip(
                            avatar: Icon(Icons.favorite_outline),
                            key: chipKey6,
                            showCheckmark: false,
                            label: Text("Waiting..."),
                            deleteIcon: Icon(Icons.change_circle_outlined),
                            onDeleted: (){},
                          );
                        }

                        //if(snapshot.connectionState==ConnectionState.done){
                        return RawChip(
                            avatar: Icon(Icons.favorite),
                            key: chipKey6,
                            showCheckmark: false,
                            selected: _counter.isEven,
                            selectedColor: Colors.lightBlue,
                            label:Text('Count: $_counter',)
                        );
                        /*
                        }else{
                          return Text("Unknown state=${snapshot.connectionState.name}");
                        }*/

                      }
                  ),
                  StreamBuilder(
                      stream: Stream.fromFuture(futureTask()),
                      builder: (context, snapshot) {

                        if(snapshot.hasError){
                          return RawChip(
                            avatar: Icon(Icons.heart_broken),
                            showCheckmark: false,
                            key: chipKey7,
                            label: Text("Error"),
                          );
                        }

                        if(snapshot.connectionState==ConnectionState.waiting){
                          return RawChip(
                            avatar: Icon(Icons.favorite_outline),
                            key: chipKey7,
                            showCheckmark: false,
                            label: Text("Waiting..."),
                            deleteIcon: Icon(Icons.change_circle_outlined),
                            onDeleted: (){},
                          );
                        }

                        //if(snapshot.connectionState==ConnectionState.done){
                        return RawChip(
                            avatar: Icon(Icons.favorite),
                            key: chipKey7,
                            showCheckmark: false,
                            selected: _counter.isEven,
                            selectedColor: Colors.lightBlue,
                            label:Text('Count: $_counter',)
                        );
                        /*
                        }else{
                          return Text("Unknown state=${snapshot.connectionState.name}");
                        }*/

                      }
                  ),
                  StreamBuilder(
                      stream: Stream.fromFuture(futureTask()),
                      builder: (context, snapshot) {

                        if(snapshot.hasError){
                          return RawChip(
                            avatar: Icon(Icons.heart_broken),
                            showCheckmark: false,
                            key: chipKey8,
                            label: Text("Error"),
                          );
                        }

                        if(snapshot.connectionState==ConnectionState.waiting){
                          return RawChip(
                            avatar: Icon(Icons.favorite_outline),
                            key: chipKey8,
                            showCheckmark: false,
                            label: Text("Waiting..."),
                            deleteIcon: Icon(Icons.change_circle_outlined),
                            onDeleted: (){},
                          );
                        }

                        //if(snapshot.connectionState==ConnectionState.done){
                        return RawChip(
                            avatar: Icon(Icons.favorite),
                            key: chipKey8,
                            showCheckmark: false,
                            selected: _counter.isEven,
                            selectedColor: Colors.lightBlue,
                            label:Text('Count: $_counter',)
                        );
                        /*
                        }else{
                          return Text("Unknown state=${snapshot.connectionState.name}");
                        }*/

                      }
                  ),
                ],
              ),
            ),
          )


        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
