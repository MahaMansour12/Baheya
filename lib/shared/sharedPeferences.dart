import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesHelperr
{
   static late SharedPreferences sharedPreferences;
  static init()async{

    sharedPreferences =await SharedPreferences.getInstance();

   }
   static setData({required String key ,required String value})async{

    return await  sharedPreferences.setString(key,value );

   }
    static
    getData({required String key})async{
     return  await sharedPreferences.get(key );


    }

}