import 'package:rush_efrei_klaus/models/furniture/table.dart';
import 'package:rush_efrei_klaus/patterns/ptable.dart';

class TableFactory implements PTable {
  @override
  Table makeTable() => Table(this);
}
