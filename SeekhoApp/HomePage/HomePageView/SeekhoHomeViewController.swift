//
//  SeekhoHomeViewController.swift
//  SeekhoApp
//
//  Created by MacBook on 30/10/24.
//

import UIKit

final class SeekhoHomeViewController: UIViewController  {
   
    @IBOutlet private(set) weak var ListTableView: UITableView!
    
    private(set) var viewmodel: SeekhoVMTypeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        
        //initialising SEEKHOVC's Viewmodel
        viewmodel = SeekhoViewModelClass(delegate: self)
        viewmodel?.input.getPopularMovies()
    }
    
    private func setupTableview(){
        //setup tableview
        ListTableView.delegate = self
        ListTableView.dataSource = self
        ListTableView.register(UINib(nibName: Constant.ListTableViewCell, bundle: nil), forCellReuseIdentifier: Constant.ListTableViewCell )
    }
}


extension SeekhoHomeViewController:SeekhoVMOutputputProtocol {
   
    func reload() {
        //callback from viewmodel to reload tableview data
        DispatchQueue.main.async { [weak self] in
            self?.ListTableView.reloadData()
        }
    }
    
    func didPresentDetailView(viewModel: DetailPageTypeProtocol) {
        //nagivate to detail page on click of specific movie to open detail page with movie ID
        let detailPageVC = DetailPageViewController(nibName: Constant.DetailPageViewController, bundle: nil)
        detailPageVC.initialise(viewModel: viewModel)
        navigationController?.pushViewController(detailPageVC, animated: true)
    }
}
