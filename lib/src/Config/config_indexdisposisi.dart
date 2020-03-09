import 'package:esdm/src/Helper/show_indexdisposisi.dart';
import 'package:esdm/src/Config/storage.dart';
import 'package:esdm/src/Model/indexDisposisi.dart';
import 'package:intl/intl.dart';

class ConfigIndexDisposisi{
  // static DateTime now = DateTime.now();
  
  static getData(ShowIndexDisposisi showIndexDisposisi){
    showIndexDisposisi
      .addItem(IndexDisposisi("Departemen agama", "2020-03-01" ,"Pengaduan", "1", "111"))
      .addItem(IndexDisposisi("Departemen dalam negeri", "2020-03-02" ,"Pemberitahuan", "1", "111"))
      .addItem(IndexDisposisi("Departemen kesehatan", "2020-03-03" ,"Saran", "1", "111"))
      .addItem(IndexDisposisi("Departemen keuangan", "2020-03-04" ,"Kritik", "1", "111"))
      .addItem(IndexDisposisi("Departemen luar negri", "2020-03-05" ,"Motivasi", "1", "111"))
      .addItem(IndexDisposisi("Departemen pendidikan", "2020-03-06" ,"Motivasi", "1", "111"));
  }
  static String indexDisposisi = "indexDisposisi";
}