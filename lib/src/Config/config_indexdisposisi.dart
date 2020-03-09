import 'package:esdm/src/Helper/show_indexdisposisi.dart';
import 'package:esdm/src/Config/storage.dart';
import 'package:esdm/src/Model/indexDisposisi.dart';
import 'package:intl/intl.dart';

class ConfigIndexDisposisi{
  // static DateTime now = DateTime.now();
  
  static getData(ShowIndexDisposisi showIndexDisposisi){
    showIndexDisposisi
      .addItem(IndexDisposisi("Departemen agama", "01/03/2020" ,"Pengaduan", 1, "111",false))
      .addItem(IndexDisposisi("Departemen dalam negeri", "02/03/2020" ,"Pemberitahuan", 1, "111",false))
      .addItem(IndexDisposisi("Departemen kesehatan", "03/03/2020" ,"Saran", 1, "111",false))
      .addItem(IndexDisposisi("Departemen keuangan", "04/03/2020" ,"Kritik", 1, "111",false))
      .addItem(IndexDisposisi("Departemen luar negri", "05/03/2020" ,"Motivasi", 1, "111",false))
      .addItem(IndexDisposisi("Departemen pendidikan", "06/03/2020" ,"Motivasi", 1, "111",false));
  }
  static String indexDisposisi = "indexDisposisi";
}