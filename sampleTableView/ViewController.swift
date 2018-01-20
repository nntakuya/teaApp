//
//  ViewController.swift
//  sampleTableView
//
//  Created by 仲松拓哉 on 19/01/2018.
//  Copyright © 2018 仲松拓哉. All rights reserved.
//

import UIKit

//1.プロトコルの追加

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    

    @IBOutlet weak var myTableView: UITableView!
    
    var teaList = ["ダージリン","アールグレイ","オレンジペコ","アッサム"]
    
    var selectedRowIndex = -1 //何行目か保存されていないときを見分けるための-1を代入
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //4.ストーリーボード上で、myTableViewのdelegateとdataSourceをViewControllerと紐付ける(myTableView右クリックで設定可能)
        //myTableViewへ指示を出すのが、ViewControllerだと設定するためのもの(これがないと、セルには何も表示されない)
        
        //(疑問)上のViewControllerとmyTableViewを紐付けする理由が分からない
        
        
    }
    
    //2.行数の決定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
        return teaList.count
    }
    
    //3. 1行に表示する文字列の作成、表示
    //　矢印の意味は「戻り値」のデータ型(確認?)
    // Cell ストーリーボードに設定したセルの名前
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //文字列を表示するセルの取得(セルの再利用) 
        // セルは一つのオブジェクト。なので、そのオブジェクトを一つ取得する
        // 一つのオブジェクトを表示したい項目の数だけ用意すると、とんでもないメモリを消費するので、メモリを節約するために、使いまわせるセルを使いまわす。
        //3-1.myTableViewにはストーリーボード上でCellを配置しておく
        //3-2. 配置したセルには"Cell#という名前をつける
        //      identifierの欄に記述
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // cellはUITableViewCellオブジェクト
        // テキストラベル
        cell.textLabel?.textColor = UIColor.orange
        
        //表示したい文字の設定
        //indexPath.row 今表示しようとしている行の行番号。0からスタート
//        cell.textLabel?.text = "\(indexPath.row)行目"
        cell.textLabel?.text = teaList[indexPath.row]
        
        //文字設定したセルを返す
        return cell
        
    }
    
    //セルをタップした時発動
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //タップされた行の番号
        
        print("\(teaList[indexPath.row])がタップされました")
        
        // 選択された行番号をメンバ変数に保存したい(セグエを使って画面移動する時に発動するメソッドが違うもののため、そこで使えるようにする)
        selectedRowIndex = indexPath.row
        
        
        
        //セグエの名前を指定して、画面遷移処理を発動(つける名前はshowDetail。ストーリーボード上でidtifierで指定)
        //下のoverride で定義している prepare関数 と下のpreformSegueが結びついている
        performSegue(withIdentifier: "showDetail", sender: nil)
        
        
        
    }
    
    //セグエを使って画面遷移してる時発動
    //上のtableView関数で定義されているperformSegue関数を使用することで使用が可能になる。
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //移動先の画面のインスタンスを取得
        //segue.destination : セグエが持っている、目的地（移動先の画面）
        //as ダウンキャスト変換 広い範囲から限定したデータ型へ型変換するときに使用
        //as! 型変換して、オプショナル型からデータを取り出す
        var dvc:DetailViewController = segue.destination as! DetailViewController
        
        //移動先の画面のプロパティに、選択された行番号を代入（これで,DetailViewControllerに選択された行番号が渡せる)
        dvc.passedIndex = selectedRowIndex
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

