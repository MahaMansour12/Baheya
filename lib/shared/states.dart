abstract class  HomeStates{}
class  AppInitialStates extends HomeStates{}
class BottomNavigationBarChang extends HomeStates{}
class LoginLoadingStates extends HomeStates{}
class LoginSuccessStates extends HomeStates{}
class LoginerrorStates extends HomeStates{
  String error;
  LoginerrorStates(this.error);
}