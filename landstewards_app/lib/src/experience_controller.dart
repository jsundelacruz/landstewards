enum ExpFilterTypes {
  Novice,
  Beginner,
  Intermediate,
  Advanced,
}

class ExpFilterController {
  Set<ExpFilterTypes> selectedFilters = {};

  String getEnumDescription(ExpFilterTypes enumValue) {
    final Map<ExpFilterTypes, String> enumToStringMap = {
      ExpFilterTypes.Novice: 'Novice: I’m new to gardening and land management.',
      ExpFilterTypes.Beginner: 'Beginner: I have some basic gardening experience.',
      ExpFilterTypes.Intermediate: 'Intermediate: I’ve worked on small-scale gardening or landscaping projects.',
      ExpFilterTypes.Advanced: 'Advanced: I have significant experience with farming or permaculture.',
    };

    return enumToStringMap[enumValue] ?? 'Unknown';
  }

  void setFilters(List<String> filters) {
    selectedFilters =
        filters.map((filter) => ExpFilterTypes.values.firstWhere((element) => element.toString() == filter)).toSet();
  }

  void addFilter(ExpFilterTypes filter) {
    selectedFilters.add(filter);
  }

  void removeFilter(ExpFilterTypes filter) {
    selectedFilters.remove(filter);
  }

  List<String> getFilters() {
    return selectedFilters.map((filter) => filter.toString()).toList();
  }
}
