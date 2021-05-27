import 'package:shared_preferences/shared_preferences.dart';

class  HelperFunctions{

  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameInKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey= "USEREMAILKEY";


  // saving data to SharedPreferences

  static Future<bool> saveUserLoggedInSharedPreference(bool isUserLoggedIn)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }
  static Future<bool> saveUserNameSharedPreference(String userName)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserNameInKey, userName);
  }
  static Future<bool> saveUserEmailSharedPreference(String userEmail)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserEmailKey, userEmail);
  }
  //getting data from SharedPreferences

  static Future<bool> getUserLoggedInSharedPreference()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(sharedPreferenceUserLoggedInKey);
  }
  static Future<String> getUserNameSharedPreference()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPreferenceUserNameInKey);
  }
  static Future<String> getUserEmailSharedPreference()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPreferenceUserNameInKey);
  }
}
