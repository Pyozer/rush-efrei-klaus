abstract class Toy {
  String _type;

  Toy(this._type);

  String get type => _type;

  void isMoved();

  @override
  bool operator ==(Object other) => other is Toy && other.type == type;
}
