void multiPrint(List<String> prints, [bool newLine = true]) {
  prints.forEach(print);
  if (newLine) print('');
}
