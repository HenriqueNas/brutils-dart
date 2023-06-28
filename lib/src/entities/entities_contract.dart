/// This contract is used to ensure that all entities
/// have the same methods and properties
abstract class EntitiesContract {
  /// Whether the value is valid
  bool isValid([String? value]);

  /// Removes all non-numeric characters from entity value
  String? unmask([String? value]);

  /// Returns the mask for entity value
  String get mask;

  /// Generates a random value for entity
  String get generate;
}
