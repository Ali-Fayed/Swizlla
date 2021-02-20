//
//  PlayerConfiguration.swift
//  Swizlla
//
//  Created by Ali Fayed on 20/02/2021.
//

import UIKit
import AVFoundation

extension PlayerViewController {
    
    func configure() {
        
        let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let urlString = urlString else {
                print("urlstring is nil")
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            guard let player = player else {
                print("player is nil")
                return
            }
            player.volume = 0.5
            player.play()
        }
        catch {
            print("error occurred")
        }
        
        albumImageView.frame = CGRect(x: 10, y: 10, width: holder.frame.size.width-20, height: holder.frame.size.width-20)
        songNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height + 10, width: holder.frame.size.width-20, height: 70)
        albumNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height + 10 + 70, width: holder.frame.size.width-20, height: 70)
        artistNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height + 10 + 140,width: holder.frame.size.width-20, height: 70)
        albumImageView.image = UIImage(named: song.imageName)
        songNameLabel.text = song.name
        albumNameLabel.text = song.albumName
        artistNameLabel.text = song.artistName
        holder.addSubview(songNameLabel)
        holder.addSubview(albumNameLabel)
        holder.addSubview(artistNameLabel)
        holder.addSubview(albumImageView)
        slider ()
        nextBackPausePlayButtons ()
    }
    
    func nextBackPausePlayButtons () {
        let nextButton = UIButton()
        let backButton = UIButton()
        holder.addSubview(nextButton)
        holder.addSubview(backButton)
        holder.addSubview(playPauseButton)
        backButton.tintColor = .black
        nextButton.tintColor = .black
        playPauseButton.tintColor = .black
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        let yPosition = artistNameLabel.frame.origin.y + 70 + 20
        let size: CGFloat = 70
        nextButton.frame = CGRect(x: holder.frame.size.width - size - 20, y: yPosition,
                                  width: size, height: size)
        backButton.frame = CGRect(x: 20, y: yPosition, width: size, height: size)
        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0, y: yPosition,
                                       width: size, height: size)
    }
    
    func slider () {
        let slider = UISlider(frame: CGRect(x: 20, y: holder.frame.size.height-60, width: holder.frame.size.width-40, height: 50))
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        holder.addSubview(slider)
    }
    
}
