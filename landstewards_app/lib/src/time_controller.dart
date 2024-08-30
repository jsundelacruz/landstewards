enum TimeFilterTypes {
  OneHour,
  OneToThreeHours,
  ThreeToFiveHours,
  FiveHours,
}

class TimeFilterController {
  Set<TimeFilterTypes> selectedFilters = {};

  String getEnumDescription(TimeFilterTypes enumValue) {
    final Map<TimeFilterTypes, String> enumToStringMap = {
      TimeFilterTypes.OneHour: 'Less than 1 hour per week.',
      TimeFilterTypes.OneToThreeHours: '1-3 hours per week.',
      TimeFilterTypes.ThreeToFiveHours: '3-5 hours per week.',
      TimeFilterTypes.FiveHours: 'More than 5 hours per week.',
    };

    return enumToStringMap[enumValue] ?? 'Unknown';
  }

  void setFilters(List<String> filters) {
    selectedFilters =
        filters.map((filter) => TimeFilterTypes.values.firstWhere((element) => element.toString() == filter)).toSet();
  }

  void addFilter(TimeFilterTypes filter) {
    selectedFilters.add(filter);
  }

  void removeFilter(TimeFilterTypes filter) {
    selectedFilters.remove(filter);
  }

  List<String> getFilters() {
    return selectedFilters.map((filter) => filter.toString()).toList();
  }
}
