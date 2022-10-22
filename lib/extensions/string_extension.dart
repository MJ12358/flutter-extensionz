extension StringExtension on String {
  String get initials {
    if (isEmpty) {
      return 'NA';
    }
    final List<String> split = this.split(RegExp(' +'));
    if (split.length >= 2) {
      return '${split[0].substring(0, 1)} ${split[1].substring(0, 1)}';
    }
    return '${split[0].substring(0, 1)} ${split[0].substring(1, 2)}';
  }

  String get capitalize {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get titleCase {
    if (isEmpty) {
      return this;
    }
    final List<String> split = this.split(RegExp(' +'));
    return split.map((String str) => str.capitalize).join(' ');
  }

  List<String> splitByLength(int length) {
    return <String>[substring(0, length), substring(length)];
  }
}
