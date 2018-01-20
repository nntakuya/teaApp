//
//  DetailViewController.swift
//  sampleTableView
//
//  Created by 仲松拓哉 on 19/01/2018.
//  Copyright © 2018 仲松拓哉. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //選択された行番号が受け渡されるプロパティ
    var passedIndex = -1 //渡されないことを判別するために-1を代入
    
    //初期化
    @IBOutlet weak var teaName: UILabel!
    
    @IBOutlet weak var explanation: UITextView!
    
    @IBOutlet weak var teaImg: UIImageView!
    
    
    var teaInfo = [
        [
            "name":"darjeeling",
            "image":"sample.jpg",
            "explain":"い香りを持つのは、寒暖の差の激しい標高の高い山地で生産されているためである。セカンドフラッシュではマスカテルフレーバー（マスカットフレーバー）と呼ばれる特徴的な香りの顕著なものが上質とされる。マスカテルフレーバーの香気成分の生成には茶葉に対するウンカの吸汁が関与するとされる。ウンカはセカンドフラッシュが摘まれる時期にもっとも多く発生する。紅茶は一般に茶葉を完全に酸化発酵させたものであるが、ダージリン地方の春摘み茶（ファーストフラッシュ）には軽発酵で、緑茶に近いものも少なくない。 現在市場に「ダージリン」の名称で出回っている茶葉は実際の生産量（全紅茶の2％程度がダージリンと言われている）よりかなり多く、ダージリンの名前を騙った偽物やほんの少量しかダージリン紅茶が含まれていない劣悪品の類が出回っていると思われる。"
        ],
        [
            "name":"earlgrey",
            "image":"sample.jpg",
            "explain":"アールグレイは、ベルガモットの落ち着きある芳香が大きな特徴である。このベルガモットの香りは精油や香料で着香されることが多い。茶の香気成分は冷やすと控え目になるが、人工的に香りを付けた着香茶であるアールグレイはアイスでも香りが比較的分かりやすいため、アイスティーに用いられることも多い。一方でベルガモットの芳香は一般的に温度が高くなるほど引き立つので、アイスティーを念頭に強めの香りをつけたものなどをホットティーにすると、慣れていない人にとっては非常に飲みにくいものとなりやすい。この芳香がミルクと相性が良いため、ミルクティーとしても飲まれる。"
        ],
        [
            "name":"orangepekoe",
            "image":"sample.jpg",
            "explain":"オレンジ・ペコー（英語: Orange pekoe若しくはOrange pecco、[pɛk.oʊ]若しくは[piː.koʊ]）は西洋の茶、特に紅茶の取引において使用される等級（オレンジ・ペコー等級）。中国語起源とする説もあるが、一般的にこの等級は、非中国語圏のスリランカやインドなど中国以外の産地の茶にも用いられる。この等級は、茶葉のサイズの大きさや形状に基づいている。茶産業では、オレンジ・ペコーの用語を特定の大きさの茶葉のうち、標準的な中等級の紅茶に用いているが、北アメリカなど、地域によってはノーブランドの紅茶の名称として使われている。但し、消費者向けには紅茶の一種として表現されることも多い。この等級において、高い等級を与えられる茶葉は、新芽から得られる。オレンジ・ペコーは少量の枝先の新芽とそのすぐ下の1枚目の若葉からなる。等級は8-30メッシュの網目の篩にかけたときの、葉の大きさによって決定される。それぞれの葉の形状の完全性、即ち欠け具合も等級に関わる。これらは葉の品質を定める要因には留まるわけではないが、葉の大きさや完全性は味、透明度、淹れ時間に影響を与える。"
        ],

        [
            "name":"assam",
            "image":"sample.jpg",
            "explain":"アッサム平原は世界有数の降水量を持ち、世界最大の紅茶産地である。アッサムの紅茶は水色が濃い茶褐色でこくが強いため、ミルクティーとして飲まれることが多い。チャイ用として細かく丸まったCTC製法（Crush Tear Curl－－つぶして、ひきさいて、丸める）で製茶されたものが多く出回っている。4月から5月にファーストフラッシュが、6月から7月にセカンドフラッシュが摘まれ、11月までが生産時期である。インド国内で消費される量が多い。"
        ]
    ]

    
    
    //準備すべきデータ
    //1.写真
    //2.teaの説明
    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("渡された行番号:\(passedIndex)")
        print(teaInfo[passedIndex])
        
        
        //指定のtea名を表示
        teaName.text = teaInfo[passedIndex]["name"]!
        //指定のteaの説明を表示
        explanation.text = teaInfo[passedIndex]["explain"]
        //指定の画像を選択
        imgSelect(teaName: teaInfo[passedIndex]["name"]!)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func imgSelect(teaName:String) {
        
        switch teaName {
        case "darjeeling" :
            teaImg.image = UIImage(named:"Darjeeling.jpeg")
        case "earlgrey" :
            teaImg.image = UIImage(named:"EarlGrey.jpeg")
        case "orangepekoe" :
            teaImg.image = #imageLiteral(resourceName: "OrangePekoe .jpeg")
        case "assam" :
            teaImg.image = UIImage(named:"Assam.jpeg")
        default:
            teaImg.image = UIImage(named:"Darjeeling.jpeg")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
