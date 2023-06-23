import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesHelperr
{
   static late SharedPreferences sharedPreferences;
  static init()async{

    sharedPreferences=await SharedPreferences.getInstance();
  }
   static void PutData(String token){

    sharedPreferences.setString('token', token);
   }
    static
    get(){
    sharedPreferences.getString('token');
   }

}