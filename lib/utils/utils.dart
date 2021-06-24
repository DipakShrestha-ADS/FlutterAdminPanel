class Utils {
  String getShortName(String data) {
    if (data.contains(' ')) {
      final splitedString = data.split(' ');
      final newData = '${splitedString[0][0]}${splitedString[1][0]}';
      return newData;
    } else {
      return data[0];
    }
  }

  String capitalizeFirstLetterOfWords(String data) {
    String dataToReturn = '';
    if (data.contains(' ')) {
      var splitData = data.split(' ');
      int pos = 0;
      final List<String> newSplitData = [];
      for (String s in splitData) {
        if (s.contains(' ') || splitData[pos].isEmpty) {
          //splitData.removeAt(pos);
        } else {
          newSplitData.add(s);
        }
        pos++;
      }
      splitData = newSplitData;
      //print('split data: $splitData');
      if (splitData[splitData.length - 1].isEmpty) {
        splitData.removeAt(splitData.length - 1);
      }
      for (String s in splitData) {
        dataToReturn += '${capitalizeOnlyFirstLetter(s)} ';
      }
    } else {
      dataToReturn = capitalizeOnlyFirstLetter(data);
    }
    if (dataToReturn[dataToReturn.length - 1].contains(' ')) {
      dataToReturn = dataToReturn.substring(0, dataToReturn.length - 1);
    }
    return dataToReturn;
  }

  String capitalizeOnlyFirstLetter(String data) {
    return data[0].toUpperCase() + data.substring(1);
  }
}
