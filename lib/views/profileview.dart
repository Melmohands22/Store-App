import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_app/cubits/layout_cubit.dart';
import 'package:store_app/cubit_State/layou_state.dart';
import '../cubit_State/auth_State.dart';
import '../cubits/auth_Cubit.dart';
import '../widgets/customButton.dart';
import 'loginView.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static String id = 'ProfileView';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit()..getUserData(),
        ),
        BlocProvider(
          create: (context) => LogoutCubit(),
        ),
      ],
      child: Scaffold(
        body: BlocConsumer<LayoutCubit, LayouState>(
          listener: (context, state) {
            if (state is GetUserDataFaild) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<LayoutCubit>(context);

            return state is GetUserDataLoadind
                ? const Center(
                child: SpinKitDancingSquare(
                  color: Colors.orange,
                  size: 80,
                ))
                : Stack(
              children: [
                Container(
                  height: 160,
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.orange,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(1000, 300))),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 80),
                    if (cubit.userModel != null)
                      Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.centerEnd,
                            children: [
                              Center(
                                child: CircleAvatar(
                                  radius: 73,
                                  backgroundImage: NetworkImage(
                                      cubit.userModel!.image!),
                                ),
                              ),
                              Positioned(
                                bottom: 2,
                                left: 230,
                                child: CircleAvatar(
                                  backgroundColor:
                                  const Color(0xffEEEEEE),
                                  radius: 24,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add_a_photo,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    const SizedBox(height: 80),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          _buildUserInfoTile(
                              icon: Icons.person,
                              text: cubit.userModel?.name ?? ''),
                          const SizedBox(height: 20),
                          _buildUserInfoTile(
                              icon: Icons.email,
                              text: cubit.userModel?.email ?? ''),
                          const SizedBox(height: 20),
                          _buildUserInfoTile(
                              icon: Icons.phone,
                              text: cubit.userModel?.phone ?? ''),
                          const SizedBox(height: 20),
                          _buildUserInfoTile(
                              icon: Icons.lock_reset,
                              text:  'Change Password'),
                          const SizedBox(height: 110),
                          BlocConsumer<LogoutCubit, LogoutState>(
                            listener: (context, state) {
                              if (state is LogoutLoadingState) {

                              } else if (state is LogoutSuccessState) {

                                Navigator.pushReplacementNamed(
                                    context, 'LoginView');
                              } else if (state is LogoutFaildState) {

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  SnackBar(
                                      content:
                                      Text(state.message)),
                                );
                              }
                            },
                            builder: (context, state) {
                              return CustomButton(
                                title: 'Logout',
                                onTap: () {
                                  BlocProvider.of<LogoutCubit>(context)
                                      .logout();
                                  Navigator.pushReplacementNamed(context, LoginView.id);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildUserInfoTile({required IconData icon, required String text}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 11,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.vertical(
          bottom: const Radius.elliptical(20, 10),
          top: const Radius.elliptical(20, 10),
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xff262A56),
          size: 36,
        ),
        title: Text(
          text,
          style: const TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
