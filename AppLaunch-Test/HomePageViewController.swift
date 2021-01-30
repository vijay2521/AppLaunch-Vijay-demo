//
//  HomePageViewController.swift
//  AppLaunch-Test
//
//  Created by Vijay's Mac on 30/01/21.
//  Copyright © 2021 Vijay's Mac. All rights reserved.
//

import UIKit
import Kingfisher

class HomePageViewController: UITableViewController {

    /// Variable for banner view
    var bannerView: AACarousel!
    let bannerUrl = ["banner1","banner2","banner3","banner4","banner4"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.backgroundColor = .black
        self.view.backgroundColor = .black
        self.tableView.delegate = self
        self.tableView.dataSource = self
       
        
        setUpNavigationBar()
        setUpRegisterTableViewCell()

    }

    fileprivate func setUpRegisterTableViewCell() {
        self.tableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "BannerTableViewCell")
        self.tableView.register(UINib(nibName: "FeatureSectionCell", bundle: nil), forCellReuseIdentifier: "FeatureSectionCell")
        self.tableView.register(UINib(nibName: "SongListCell", bundle: nil), forCellReuseIdentifier: "SongListCell")
    }
    
    fileprivate func setUpNavigationBar() {
        self.title = "Amazon Music"
        navigationController?.navigationBar.backgroundColor = UIColor.black
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        let imageView = UIImageView(image: UIImage(named: "menu"))
        let buttonItem = UIBarButtonItem(customView: imageView)
        self.navigationItem.rightBarButtonItem = buttonItem
        
        let customView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
        customView.image = UIImage(named: "profile")
        customView.contentMode = UIView.ContentMode.center
        //customView.layer.cornerRadius = customView.frame.height / 2
        //customView.layer.masksToBounds = true
        let customViewItem = UIBarButtonItem(customView: customView)
        self.navigationItem.leftBarButtonItem = customViewItem
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 3 ? 3 : 1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as! BannerTableViewCell
               self.bannerView = cell.bannerView
               self.loadBannerData()
               return cell
        case 3:
             let cell = tableView.dequeueReusableCell(withIdentifier: "SongListCell") as! SongListCell
             cell.backgroundColor = UIColor.black
             cell.songPosterImage.image = UIImage(named: "album")
             cell.songName.text = "Bhula diya"
             cell.castName.text = "Alexa,Arjit"
            return cell
        default:
           let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureSectionCell") as! FeatureSectionCell
             cell.backgroundColor = UIColor.black
             cell.featureSectionCollectionView.delegate = self
             cell.featureSectionCollectionView.dataSource = self
             cell.featureSectionCollectionView.backgroundColor = UIColor.clear
             if let layout = cell.featureSectionCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                   layout.scrollDirection = .horizontal
            }
            cell.featureSectionCollectionView.tag = indexPath.section
            cell.featureSectionCollectionView.register(UINib(nibName: "EachFeatureItemCell", bundle: nil), forCellWithReuseIdentifier: "EachFeatureItemCell")
           
             cell.featureSectionCollectionView.reloadData()
            return cell
            
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 250
        case 3:
            return 80
        default:
            return 250
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return UIView()
        default:
            let mainHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 35))
            let headerView = UIView(frame: .zero)
            headerView.translatesAutoresizingMaskIntoConstraints = false
                       NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalToConstant: tableView.bounds.size.width),
            headerView.heightAnchor.constraint(equalToConstant: 35),])
            headerView.backgroundColor = .black
            
            let headerLabel = UILabel()
            headerLabel.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(headerLabel)
            NSLayoutConstraint.activate([
                headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 5),
                headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5),
                headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -120),
                headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5),
            ])
            headerLabel.textColor = UIColor.white
            headerLabel.lineBreakMode = .byTruncatingTail
            
            let headerButton = UIButton(type: .system)
            headerButton.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(headerButton)
            
            NSLayoutConstraint.activate([
                headerButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 5),
                headerButton.leadingAnchor.constraint(equalTo: headerLabel.trailingAnchor, constant: 5),
                headerButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -5),
                headerButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5),
                ])
            
            headerButton.layer.cornerRadius = 12
            headerButton.clipsToBounds = true
            headerButton.backgroundColor = UIColor.darkGray
            headerButton.setTitleColor(.white, for: .normal)
            headerButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
            
            headerLabel.text = "Cosy Evening"
            headerButton.setTitle("See More", for: .normal)
            mainHeaderView.addSubview(headerView)
            return mainHeaderView
        }
    }
    
}

//MARK:- Delegates methods for Carousel View
  ///
extension HomePageViewController : AACarouselDelegate {
    /// loadBanner : For Loding Banner Image
    /// - Returns: Void
    private func loadBannerData(){
        bannerView.delegate = self
        bannerView.setCarouselData(paths: bannerUrl, describedTitle: [""], isAutoScroll: true, timer: 5.0, defaultImage: "banner1")
        bannerView.setCarouselOpaque(layer: false, describedTitle: false, pageIndicator: false)
        bannerView.setCarouselLayout(displayStyle: 1, pageIndicatorPositon: 0, pageIndicatorColor: UIColor.clear, describedTitleColor: UIColor.clear, layerColor: UIColor.clear)
        bannerView.setCarouselOpaque(layer: true, describedTitle: true, pageIndicator: true)
    }
    
   
    func downloadImages(_ url: String, _ index: Int) {
        

    }
    /// callBackFirstDisplayView : function for loading Image for Sliding in Banner
    /// - Returns: Void
    func callBackFirstDisplayView(_ imageView: UIImageView, _ url: [String], _ index: Int) {
        imageView.image = UIImage(named: bannerUrl[index])
        
    }
    
    
}

//MARK:- Collectionview delegate and datasource
extension HomePageViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EachFeatureItemCell", for: indexPath) as! EachFeatureItemCell
        cell.featuredSectionImage.image = UIImage(named: "SongPoster")
        cell.contentNameLabel.text = "Assess core:My Mix Music"
        cell.castLabel.text = "Arjit Singth,Sriya Ghosal"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: (UIScreen.main.bounds.size.width / 2.5) - 10 , height: UIScreen.main.bounds.size.width / 2.5 + 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 5)
    }
}
