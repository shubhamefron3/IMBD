//
//  DetailPageViewController.swift
//  SeekhoApp
//
//  Created by MacBook on 30/10/24.
//

import UIKit
import YouTubeiOSPlayerHelper
//import AVKit
//import AVFoundation

final class DetailPageViewController: UIViewController {
    
    @IBOutlet private(set) weak var videoPlayerView: UIView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var genreLabel: UILabel!
    @IBOutlet private(set) weak var castLabel: UILabel!
    @IBOutlet private(set) weak var durationLabel: UILabel!
    @IBOutlet private(set) weak var ratingLabel: UILabel!
    
    private var viewModel: DetailPageTypeProtocol?
    
    private var playerView: YTPlayerView! //using youtube sdk as youtube video are not supoorted by avp player
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //calling detail page api from rapid apis
        // Do any additional setup after loading the view.
    }
    
    func initialise(viewModel: DetailPageTypeProtocol) {
        self.viewModel = viewModel
        viewModel.input.initWith(delegate: self)
        viewModel.input.getMoviesDetailbyID()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //to render corner radius in view's lifecycle
        videoPlayerView.layer.cornerRadius = 12
        videoPlayerView.layer.masksToBounds = true
    }
    
    private func setupUI(){
        videoPlayerView.layer.cornerRadius = 12
        videoPlayerView.layer.borderWidth = 1
        videoPlayerView.layer.masksToBounds = true
        videoPlayerView.layer.borderColor = UIColor.white.cgColor
    }
    
    
    private func updateview(model: MoviesDetails?){
        titleLabel.text = model?.title
        genreLabel.text = model?.genre?.first
        castLabel.text = model?.director?.first
        durationLabel.text = "\(model?.rank ?? 0)"
        ratingLabel.text = model?.rating
        playTrailer(videoUrl:  viewModel?.movieDetaildModel?.trailerYoutubeID ?? "" )
        
    }
    
    private func playTrailer(videoUrl:String){
        playerView = YTPlayerView(frame: self.videoPlayerView.bounds)
        self.videoPlayerView.addSubview(playerView)
        playerView.load(withVideoId: videoUrl)
        
        ///MARK:  As response video url is of Youtube which is not supported for AVPlayer, either have to use webview or pod
        ///for in genreal videos we always prefer to run videos in AVP player only
//        let videoURL = URL(string: videoUrl)
//        let player = AVPlayer(url: videoURL!)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.frame = self.videoPlayerView.bounds
//        self.videoPlayerView.layer.addSublayer(playerLayer)
//        player.play()
    }
}
extension DetailPageViewController: DetailPageOutputProtocol {
    func updateUI(model: MoviesDetails) {
        DispatchQueue.main.async {
            //updateUi data after getting details page api success response 
            self.updateview(model: model)
        }
        
    }
}
