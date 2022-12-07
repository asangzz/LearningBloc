import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc/logic/bloc/connectivity_bloc.dart';
import 'package:practice_bloc/logic/cubit/cubit/connectivity_cubit.dart';
import 'package:practice_bloc/screens/home2.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocConsumer<ConnectivityCubit, ConnectivityCubitState>(
              listener: (context, state) {
                if (state == ConnectivityCubitState.Connected) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Connected'),
                    backgroundColor: Colors.greenAccent,
                  ));
                } else if (state == ConnectivityCubitState.Disconnected) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Disconnected'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state == ConnectivityCubitState.Connected) {
                  return const Text("Connected");
                } else if (state == ConnectivityCubitState.Disconnected) {
                  return const Text("DisConnected");
                } else {
                  return const Text("Loading...");
                }
              },
            ),
          ),
          BlocProvider(
            create: (context) => ConnectivityBloc(),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => ConnectivityBloc(),
                              child: Home2(),
                            )),
                  );
                },
                child: const Text('Go to Home2')),
          ),
          // Center(
          //   child: BlocConsumer<ConnectivityBloc, ConnectivityState>(
          //     listener: (context, state) {
          //       if (state is ConnectivityEnabledState) {
          //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //           content: Text('Connected'),
          //           backgroundColor: Colors.greenAccent,
          //         ));
          //       } else if (state is ConnectivityDisabledState) {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(
          //             content: Text('Disconnected'),
          //             backgroundColor: Colors.redAccent,
          //           ),
          //         );
          //       }
          //     },
          //     builder: (context, state) {
          //       if (state is ConnectivityEnabledState) {
          //         return const Text("Connected");
          //       } else if (state is ConnectivityDisabledState) {
          //         return const Text("DisConnected");
          //       } else {
          //         return const Text("Loading...");
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
