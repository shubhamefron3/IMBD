//
//  HomeVc + TableviewExtension.swift
//  SeekhoApp
//
//  Created by MacBook on 30/10/24.
//

import Foundation
import UIKit

extension SeekhoHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel?.popularMoviesModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = ListTableView.dequeueReusableCell(withIdentifier: Constant.ListTableViewCell, for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        if let model = viewmodel?.popularMoviesModel {
            cell.updateView(model: model[indexPath.row])
        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //navigate to detail page with movie id on click 
        viewmodel?.input.didTapAction(indexPath.row)
    }
    
}
