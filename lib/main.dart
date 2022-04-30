import 'package:counter/bloc/counter_bloc.dart';
import 'package:counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

// * With Built in Flutter StatefulWidget

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   void _decrementCounter() {
//     setState(() {
//       _counter--;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("counter"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: const TextStyle(fontSize: 34),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _incrementCounter();
//               },
//               child: const Text(
//                 "increment",
//                 style: TextStyle(fontSize: 32),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _decrementCounter();
//               },
//               child: const Text(
//                 "Decrement",
//                 style: TextStyle(fontSize: 32),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//* With using Cubit

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Implementation"),
      ),
      body: Center(
        child: BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
          child: Builder(
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  "${context.watch<CounterCubit>().state.counter}",
                  style: const TextStyle(fontSize: 34),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().incrementCounter();
                  },
                  child: const Text(
                    "increment",
                    style: TextStyle(fontSize: 32),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrementCounter();
                  },
                  child: const Text(
                    "Decrement",
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//* Using BLoC

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Bloc Implementation"),
//       ),
//       body: Center(
//         child: BlocProvider<CounterBloc>(
//           create: (context) => CounterBloc(),
//           child: Builder(
//             builder: (context) => Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 const Text(
//                   'You have pushed the button this many times:',
//                 ),
//                 Text(
//                   "${context.watch<CounterBloc>().state.counter}",
//                   style: const TextStyle(fontSize: 34),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.read<CounterBloc>().add(IncrementCounterEvent());
//                   },
//                   child: const Text(
//                     "increment",
//                     style: TextStyle(fontSize: 32),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.read<CounterBloc>().add(DecrementCounterEvent());
//                   },
//                   child: const Text(
//                     "Decrement",
//                     style: TextStyle(fontSize: 32),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
