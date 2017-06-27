//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 오민호 on 2017. 6. 26..
//  Copyright © 2017년 오민호. All rights reserved.
//

import UIKit
class ListViewController : UITableViewController {
    var dataset = [
        ("다크 나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.","2008-09-04",8.95,"darknight.jpg"),
        ("호우시절", "때를 알고 내리는 좋은 비","2009-10-08",7.31,"rain.jpg"),
        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07",9.9,"secret.jpg")
    ]
    
    lazy var list : [MovieVO] = {
        var datalist = [MovieVO]()
        for(title, desc, opendate, rating, thumbnail) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            datalist.append(mvo)
        }
        return datalist
    }()
    
    override func viewDidLoad() {
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        
        cell.title.text = row.title
        cell.desc.text = row.description
        cell.opendate.text = row.opendate
        cell.rating.text = "\(row.rating!)"
        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은\(indexPath.row)번째 행입니다.")
    }
}
