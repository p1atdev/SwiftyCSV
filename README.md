# SwiftyCSV
## 使い方

```CSV
1,01/01,はれ
2,05/12,くもり,25°C
3,12/3

```

```Swift
//csvの指定
let csvData = CSV("csvs/", name: "data") ///Documents/csvs/data.csv

//読み込み
let readData: Array<Array<String>> = csvData.read()
/*
出力
[["1","01/01","はれ"]["2","05/12","くもり","25°C"]["3","12/3"]]
*/

```
