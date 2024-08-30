enum PlantsFilterTypes {
  Trees,
  Shrubs,
  Wildflowers,
  Grasses,
  Groundcovers,
  FruitVeg,
  Medicinal,
  Pollinators,
  IDontKnow,
}

class PlantsFilterController {
  Set<PlantsFilterTypes> selectedFilters = {};

  String getEnumDescription(PlantsFilterTypes enumValue) {
    final Map<PlantsFilterTypes, String> enumToStringMap = {
      PlantsFilterTypes.Trees: 'Trees',
      PlantsFilterTypes.Shrubs: 'Shrubs',
      PlantsFilterTypes.Wildflowers: 'Wildflowers',
      PlantsFilterTypes.Grasses: 'Grasses',
      PlantsFilterTypes.Groundcovers: 'Ground Covers',
      PlantsFilterTypes.FruitVeg: 'Fruit/Veg',
      PlantsFilterTypes.Medicinal: 'Medicinal',
      PlantsFilterTypes.Pollinators: 'Pollinators',
      PlantsFilterTypes.IDontKnow: 'I don’t know',
    };

    return enumToStringMap[enumValue] ?? 'Unknown';
  }

  void setFilters(List<String> filters) {
    selectedFilters =
        filters.map((filter) => PlantsFilterTypes.values.firstWhere((element) => element.toString() == filter)).toSet();
  }

  void addFilter(PlantsFilterTypes filter) {
    selectedFilters.add(filter);
  }

  void removeFilter(PlantsFilterTypes filter) {
    selectedFilters.remove(filter);
  }

  List<String> getFilters() {
    return selectedFilters.map((filter) => filter.toString()).toList();
  }
}
