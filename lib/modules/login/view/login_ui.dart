import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/login_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginUI(),
    );
  }
}

class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.red,
                ),
              ),
            );
          } else if (state.isAuthenticated) {
            return Column(
              children: [
                Text(state.loginDTO?.name ?? ''),
                Text(state.loginDTO?.email ?? ''),
                Text(state.loginDTO?.uid ?? ''),
                Image.network(state.loginDTO?.photoUrl ?? ''),
                ElevatedButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(const FacebookLogout());
                  },
                  child: const Text(
                    "Facebook logout",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: ElevatedButton(
                child: const Text(
                  "Facebook login",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  context.read<LoginBloc>().add(const FacebookLogin());
                },
              ),
            );
          }
        },
      ),
    );
  }
}

// facebookLogin() async {
//     print("FaceBook");
//     try {
//       final result =
//           await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
//       if (result.status == LoginStatus.success) {
//         final userData = await FacebookAuth.i.getUserData();
//         print(userData);
//       }
//     } catch (error) {
//       print(error);
//     }
//   }
