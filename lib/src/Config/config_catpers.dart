import 'package:esdm/src/Helper/show_catpers.dart';
// import 'package:esdm/src/Config/storage.dart';
import 'package:esdm/src/Model/catpers.dart';
// import 'package:intl/intl.dart';

class ConfigCatpers{
  static getData(ShowCatpers showCatpers){
    showCatpers
      .addItem(Catpers("Gusti", "Colors.green"))
      .addItem(Catpers("Agung", "Colors.green"))
      .addItem(Catpers("Pratama", "Colors.green"))
      .addItem(Catpers("Juan", "Colors.green"))
      .addItem(Catpers("Ali", "Colors.green"));
  }
  static String catpers = "catpers";
}