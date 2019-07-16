import 'package:rush_efrei_klaus/models/furniture/conveyor_belt.dart';
import 'package:rush_efrei_klaus/models/furniture/table.dart';
import 'package:rush_efrei_klaus/patterns/conveyor_belt_factory.dart';
import 'package:rush_efrei_klaus/patterns/table_factory.dart';

class WorkStation {
  Table table;
  ConveyorBelt conveyorBelt;

  WorkStation(this.table, this.conveyorBelt);

  factory WorkStation.create() => WorkStation(
        TableFactory().makeTable(),
        ConveyorBeltFactory().makeConveyorBelt(),
      );
}
