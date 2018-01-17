//
//  ViewController.swift
//  Quartz2D-Demo
//
//  Created by Vampire_时代 on 2018/1/15.
//  Copyright © 2018年 Vampire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextCell.self, forCellReuseIdentifier: "TextCell")
        return tableView
    }()
    
    fileprivate var dataSoce = [("画心","DrawHeartView"),
                                ("绘文字","DrawTextView"),
                                ("绘图片","DrewImageView"),
                                ("添加水印","DrawWatermarkView"),
                                ("获取截屏","Screenshots"),
                                ("画板","DrawingBoardView")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Demo"
        self.view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
    }
    
}
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
        let contentText = dataSoce[indexPath.row].0
        cell.textLabel?.text = contentText
        cell.detailTextLabel?.textColor = .gray
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSoce.count
    }
    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bearingVc = BearingViewController()
        bearingVc.viewName = dataSoce[indexPath.row].1
        bearingVc.navigationController?.title = dataSoce[indexPath.row].0
        self.navigationController?.pushViewController(bearingVc, animated: true)
    }
}
// MARK: - TextCell
final class TextCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
