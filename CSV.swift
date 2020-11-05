//
//  CSV.swift
//  Practice
//
//  Created by Platina on 2020/11/05.
//

import Foundation

class CSV {
    
    //ファイルパス
    var path: String
    
    //ファイル名
    var name: String
    
    init(_ path: String, name: String) {
        
        self.path = path
        self.name = name
        
    }
    
}

extension CSV {
    
    //書き込み
    func read() -> Array<Array<String>> {
        
        //ファイルのパス
        let filePath = NSHomeDirectory() + "/Documents/" + path + name + ".csv"
        
        //出力array
        var outputArray: Array<Array<String>> = []
        
        //CSVデータ読み込み
        do {
            if let csvStringData: String = try String(contentsOfFile: filePath, encoding: String.Encoding.utf8) {
                
                //行で区切って
                let lines = csvStringData.components(separatedBy: "\n")
                
                //行ごとに
                for var line in lines {
                    
                    //もし","があったら別のものに置き換え
                    line = line.replacingOccurrences(of: "\",\"", with: "‘")
                    
                    //カンマ区切りで分割
                    let wordsArray = line.components(separatedBy: ",")
                    
                    //文字置き換え後のarray
                    var convertedArray: Array<String> = []
                    
                    //変換した文字を元に戻す
                    for word in wordsArray{
                        
                        convertedArray.append(word.replacingOccurrences(of: "‘", with: ","))
                        
                    }
                    
                    //単語データを追加
                    outputArray.append(convertedArray)
                    
                }
                
                //最後の空白を削除
                outputArray.removeLast()
                
            }
        } catch let error {
            //ファイル読み込みエラー時
            print(error)
        }
        
        
        //arrayを返す
        return outputArray
        
    }
    
    //書き込み
    func write(){
        
    }
    
    //csvがあるか調べる
    func check() -> Bool{
        
        //パス
        let filePath = NSHomeDirectory() + "/Documents/" + path + name + ".csv"
        
        do {
            //これが成功したらtrue
            let csvString = try String(contentsOfFile: filePath, encoding: String.Encoding.utf8)
            return true
            
        } catch let error as NSError {
            
            //失敗したらfalse
            print("エラー: \(error)")
            return false
        }
        
    }
    
    
    
}
