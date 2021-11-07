MAP:
void main() {
  const list = [1, 2, 3];
  const l2 = [1.0, 2.0, 3.0];
  list.forEach(print);
  //final List<int> doubles = list.map((value) => value *2).toList();

  final doubles = transform<int, int>(list, (x) => x * 2);

  final rounded = transform<double, int>(l2, (x) => x.round());
  print(doubles);
  print(rounded);
}

List<R> transform<T, R>(List<T> items, R Function(T) f) {
  var result = <R>[];
  for (var x in items) {
    result.add(f(x));
  }
  return result;
}

List<int> doubleItems(List<int> items) {
  var result = <int>[];
  for (var x in items) {
    result.add(x * 2);
  }
  return result;
}

// transform(items, f) {
//   var result = [];
//   for (var x in items) {
//     result.add(f(x));
//   }
//   return result;
// }

WHERE:
void main() {
  const list = [1,2,3,4];
  final odd = where<int>(list, (x) => x%2 == 1);
  print(odd);
  
}
List<T> where<T>(List<T> list, bool Function(T) function) {
  var filteredList = <T>[];
  for (var item in list) {
    if (function(item)) {
      filteredList.add(item);
    }
  }
  return filteredList;
}

FIRSTWHERE:
void main() {
  const list = [1, 2, 3, 4];
  final findFirst = firstWhere(list, (x) => x == 5, orElse: () => -1);
  print(findFirst);
}

T firstWhere<T>(List<T> list, bool Function(T) function,
    {required T Function() orElse}) {
  for (var item in list) {
    if (function(item)) {
      return item;
    }
  }
  return orElse();
}

COMBINE:
void main() {
  const emails = [
    'sdf@gmail.com',
    'adfadf@adfasdfsdf.com',
    'urban.marton@yahoo.com',
    'urbankaisdf@uzuzzzzzz.com',
  ];
  const knownDomains = ['gmail.com', 'yahoo.com'];
  final unknownDomains = getUnknownDomains(emails, knownDomains);
  print(unknownDomains);
}
Iterable<String> getUnknownDomains(List<String> emails, List<String> knownDomains) => emails
    .map((email) => email.split('@').last)
    .where((domain) => !knownDomains.contains(domain));