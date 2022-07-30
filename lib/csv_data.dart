import 'dart:io';

import 'package:csv/csv.dart';
import 'package:prog2/delimited_data.dart';

class CSVData extends DelimitedData {
  dynamic csvList1 = [];
  List<String> field = [];

  @override
  String get separator => ',';

  @override
  void load(csvfile) {
    csvfile = File(csvfile).readAsStringSync();
    csvList1 = const CsvToListConverter().convert(csvfile, eol: '\n');
    final csvList = const CsvToListConverter().convert(csvfile, eol: '\n');
    //assert(csvList.toString() == [[',b', 3.1, 42], ['n\n']].toString());
    //List<String> lis = csvList[0];
    field = csvList[0].map((e) => e.toString()).toList();
    print(csvList1[0]);
  }

  @override
  List<String> get fields => field;

  @override
  void save(String fileName) {
    // TODO: implement save
  }

  @override
  String get data => csvList1.toString();
  set data(value) {
    csvList1 = value as List;
  }

  @override
  void clear() {
    csvList1 = "";
  }

  @override
  bool get hasData => !csvList1.isEmpty;
}
