import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_app/cubits/layout_cubit.dart';
import 'package:store_app/layou_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static String id = 'ProfileView';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getUserData(),
      child: BlocConsumer<LayoutCubit, LayouState>(
        listener: (context, state) {
          if (state is GetUserDataFaild) {

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: state is GetUserDataLoadind
                ? const Center(child:  SpinKitDancingSquare(
              color: Colors.orange,
              size: 80,))
                : Column(
              children: [
                if (cubit.userModel != null)
                  CircleAvatar(
                    backgroundImage: NetworkImage(cubit.userModel!.image!),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
