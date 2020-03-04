import 'package:esdm/src/Helper/show_indexdisposisi.dart';
import 'package:esdm/src/Config/storage.dart';
import 'package:esdm/src/Model/indexDisposisi.dart';
import 'package:intl/intl.dart';

class ConfigIndexDisposisi{
  // static DateTime now = DateTime.now();
  
  static getData(ShowIndexDisposisi showIndexDisposisi){
    showIndexDisposisi
      .addItem(IndexDisposisi("Gusti", "2020-03-03" ,"Pengaduan"))
      .addItem(IndexDisposisi("Agung", "2020-03-03" ,"Pemberitahuan"))
      .addItem(IndexDisposisi("Pratama", "2020-03-03" ,"Saran"))
      .addItem(IndexDisposisi("Juan", "2020-03-03" ,"Kritik"))
      .addItem(IndexDisposisi("Ali", "2020-03-03" ,"Motivasi"));
  }
  static String indexDisposisi = "indexDisposisi";
}