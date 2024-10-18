import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_state_management/bloc/switch/switch_event.dart';
import 'package:flutter_bloc_state_management/bloc/switch/switch_state.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isEnable != current.isEnable,
                  builder: (context, state) {
                    // print("Building 1");

                    return Switch(
                        value: state.isEnable,
                        onChanged: (value) {
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisableNotification());
                        });
                  },
                )
              ],
            ),
            SizedBox(
              height: height * 0.1,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                // print("Building 2");

                return Container(
                  height: height * 0.3,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            SizedBox(
              height: height * 0.05,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (prev, curr) => prev.slider != curr.slider,
              builder: (context, state) {
                // print("Building 3");
                return Slider(
                    value: state.slider,
                    onChanged: (double val) {
                      context.read<SwitchBloc>().add(SliderEvent(slider: val));
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
