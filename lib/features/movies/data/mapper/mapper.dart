import '../../../../core/helpers/constants.dart';
import '../../domain/entities/movie_genre_entity.dart';
import '../models/genre.dart';
import 'genre_mapper.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero.toInt();
    } else {
      return this!;
    }
  }
}

extension NonNullList on List<int>? {
  List<int> orEmpty() {
    if (this == null) {
      return Constants.emptyList;
    } else {
      return this!;
    }
  }
}

extension NonNullDateTime on String? {
  DateTime orNow() {
    if (this == null || this!.isEmpty) {
      return DateTime.now();
    } else {
      return DateTime.parse(this!);
    }
  }
}

extension NonNullBool on bool? {
  bool orFalse() {
    return this ?? Constants.falseValue;
  }
}
extension NonNullGenreList on List<Genre>? {
  List<MovieGenreEntity> orEmpty() {
    if (this == null) {
      return Constants.emptyGenreList;
    } else {
      return this!.map((genre) => genre.toDomain()).toList();
    }
  }
}

// extension StringExtensions on String? {
//   bool get isNullOrEmpty => this == null || this!.isEmpty;
//   bool get isNotNullOrEmpty => !isNullOrEmpty;
//   String orDefault([String defaultValue = '']) => isNullOrEmpty ? defaultValue : this!;
//   String get orNA => orDefault('N/A');
//   String get orUnknown => orDefault('Unknown');
//   String get fullImageUrl {
//     if (isNullOrEmpty) return '';
//     return 'https://image.tmdb.org/t/p/w500$this';
//   }
//   String tmdbImageUrl([String size = 'w500']) {
//     if (isNullOrEmpty) return '';
//     return 'https://image.tmdb.org/t/p/$size$this';
//   }
//   String get formattedReleaseDate {
//     if (isNullOrEmpty) return 'Release date unknown';
//     try {
//       final date = DateTime.parse(this!);
//       final months = [
//         'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
//         'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
//       ];
//       return '${months[date.month - 1]} ${date.day}, ${date.year}';
//     } catch (e) {
//       return this!;
//     }
//   }
//   /// Returns year from date string
//   String get yearFromDate {
//     if (isNullOrEmpty) return '';
//     try {
//       final date = DateTime.parse(this!);
//       return date.year.toString();
//     } catch (e) {
//       return '';
//     }
//   }
// }

// extension DoubleExtensions on double? {
//   double get orZero => this ?? 0.0;
//   double orDefault([double defaultValue = 0.0]) => this ?? defaultValue;
//   String get formattedRating => this == null ? 'N/A' : '${this!.toStringAsFixed(1)}/10';

//   /// Formats rating as percentage
//   String get ratingAsPercentage => this == null ? 'N/A' : '${(this! * 10).toInt()}%';

//   /// Returns star rating out of 5
//   double get starsOutOfFive {
//     if (this == null) return 0.0;
//     return (this! / 2).clamp(0.0, 5.0);
//   }
//   String get formattedPopularity {
//     if (this == null) return 'N/A';
//     final value = this!;
//     if (value >= 1000000) {
//       return '${(value / 1000000).toStringAsFixed(1)}M';
//     } else if (value >= 1000) {
//       return '${(value / 1000).toStringAsFixed(1)}K';
//     }
//     return value.toStringAsFixed(0);
//   }
//   /// Returns true if rating is good (>= 7.0)
//   bool get isGoodRating => this != null && this! >= 7.0;

//   /// Returns true if rating is poor (< 5.0)
//   bool get isPoorRating => this != null && this! < 5.0;

//   /// Formats as currency with M/B suffixes
//   String get formattedCurrency {
//     if (this == null || this! <= 0) return 'N/A';
//     final value = this!;
//     if (value >= 1000000000) {
//       return '\$${(value / 1000000000).toStringAsFixed(1)}B';
//     } else if (value >= 1000000) {
//       return '\$${(value / 1000000).toStringAsFixed(1)}M';
//     } else if (value >= 1000) {
//       return '\$${(value / 1000).toStringAsFixed(1)}K';
//     }
//     return '\$${value.toStringAsFixed(0)}';
//   }
// }

// extension IntExtensions on int? {
//   int get orZero => this ?? 0;

//   int orDefault([int defaultValue = 0]) => this ?? defaultValue;

//   String get formattedRuntime {
//     if (this == null || this! <= 0) return 'Runtime unknown';
//     final hours = this! ~/ 60;
//     final minutes = this! % 60;
//     if (hours > 0) {
//       return minutes > 0 ? '${hours}h ${minutes}m' : '${hours}h';
//     } else {
//       return '${minutes}m';
//     }
//   }
//   String get formattedNumber {
//     if (this == null) return 'N/A';
//     final value = this!;
//     if (value >= 1000000000) {
//       return '${(value / 1000000000).toStringAsFixed(1)}B';
//     } else if (value >= 1000000) {
//       return '${(value / 1000000).toStringAsFixed(1)}M';
//     } else if (value >= 1000) {
//       return '${(value / 1000).toStringAsFixed(1)}K';
//     }
//     return value.toString();
//   }

//   /// Formats as currency
//   String get formattedCurrency {
//     if (this == null || this! <= 0) return 'N/A';
//     final value = this!;
//     if (value >= 1000000000) {
//       return '\$${(value / 1000000000).toStringAsFixed(1)}B';
//     } else if (value >= 1000000) {
//       return '\$${(value / 1000000).toStringAsFixed(1)}M';
//     } else if (value >= 1000) {
//       return '\$${(value / 1000).toStringAsFixed(1)}K';
//     }
//     return '\$${value.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
//   }

//   String get ordinal {
//     if (this == null) return '';
//     final value = this!;
//     if ((value % 100) >= 11 && (value % 100) <= 13) {
//       return '${value}th';
//     }
//     switch (value % 10) {
//       case 1: return '${value}st';
//       case 2: return '${value}nd';
//       case 3: return '${value}rd';
//       default: return '${value}th';
//     }
//   }

//   bool get isValidMovieYear {
//     if (this == null) return false;
//     final currentYear = DateTime.now().year;
//     return this! >= 1888 && this! <= currentYear + 5;
//   }
//   String get formattedVoteCount {
//     if (this == null || this! <= 0) return 'No votes';
//     final count = this!;
//     if (count == 1) return '1 vote';
//     return '${count.formattedNumber} votes';
//   }
// }
