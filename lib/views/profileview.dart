<<<<<<< HEAD
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
=======
>>>>>>> 56856a3 (edit home view and profile view)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_app/cubits/layout_cubit.dart';
<<<<<<< HEAD
import 'package:store_app/layou_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
=======
import 'package:store_app/cubit_State/layou_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

>>>>>>> 56856a3 (edit home view and profile view)
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
<<<<<<< HEAD

=======
>>>>>>> 56856a3 (edit home view and profile view)
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<LayoutCubit>(context);
<<<<<<< HEAD

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
=======
          return Scaffold(
            body: state is GetUserDataLoadind
                ? const Center(
                    child: SpinKitDancingSquare(
                    color: Colors.orange,
                    size: 80,
                  ))
                : Stack(children: [
                    Container(
                      height: 180,
                      child: AppBar(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(bottom: Radius.elliptical(800, 250))),
                        toolbarHeight: .5,
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                cubit.userModel?.name ?? '',
                                style: const TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Column(
                      children: [
                        SizedBox(height: 110),
                        if (cubit.userModel != null)
                          Center(
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(cubit.userModel!.image!),
                            ),
                          ),
                        const SizedBox(height: 30),
                        Container(
                          height: 60,
                          width: 380,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Card(
                              elevation: 15,
                              color: Colors.white,
                              child: Text(
                                cubit.userModel!.email!,
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
>>>>>>> 56856a3 (edit home view and profile view)
          );
        },
      ),
    );
  }
}
