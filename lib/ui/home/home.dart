import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/ui/editingAccount/editAccount.dart';
import 'package:untitled2/ui/sign_in.dart';

import '../../shared/cubit.dart';
import '../../shared/states.dart';

class home_screen extends StatelessWidget {
  static const String routName = 'home';

  @override
  Widget build(BuildContext context) {
    final String data = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Sign_IN.routeName);
                  },
                  child: const Icon(Icons.arrow_back_ios_new_outlined,
                      color: Colors.black, size: 25)),
              actions:  [
                Icon(Icons.notifications_none_rounded,color:Colors.black,size: 25),
                SizedBox(width: 10,),
                InkWell(
                  onTap: (){
                    Navigator.pushReplacementNamed(
                        context, editAccount.routName);
                  },
                    child: Icon(Icons.settings_outlined,color:Colors.black,size: 25)),
                SizedBox(width: 10,),

              ],
            ),
            bottomNavigationBar: BottomNavigationBar(


              elevation:  8,
              currentIndex: AppCubit.get(context).currentIndex,
              onTap: (index) {
                AppCubit.get(context).ButtomNavBar(index);
              },
              items: const [
                BottomNavigationBarItem(

                    icon: ImageIcon(AssetImage('asstes/images/home.png'),color: Colors.grey,size: 35),
                    label: "awareness ",),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('asstes/images/event.png'),color: Colors.grey,size: 35),
                    label: "Event"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('asstes/images/support.png'),color: Colors.grey,size: 35),
                    label: "Support "),
                BottomNavigationBarItem(
                    icon:Icon(Icons.supervisor_account,color: Colors.grey,size: 35),
                    label: "Account "),
              ],

            ),
          ),
        ));
  }
}
