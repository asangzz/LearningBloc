import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc/logic/bloc/connectivity_bloc.dart';

import 'home.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectivityBloc(),
      child: Scaffold(
        backgroundColor: Colors.red[50],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: BlocConsumer<ConnectivityBloc, ConnectivityState>(
                listener: (context, state) {
                  if (state is ConnectivityEnabledState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Connected'),
                      backgroundColor: Colors.greenAccent,
                    ));
                  } else if (state is ConnectivityDisabledState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Disconnected'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ConnectivityEnabledState) {
                    return const Text("Connected");
                  } else if (state is ConnectivityDisabledState) {
                    return const Text("DisConnected");
                  } else {
                    return const Text("Loading...");
                  }
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: const Text('Go to Home2')),
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
      ),
    );
  }
}
