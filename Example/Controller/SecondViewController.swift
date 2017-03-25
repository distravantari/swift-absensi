//
//  SecondViewController.swift
//  Example
//
//  Created by Node8 on 3/21/17.
//  Copyright © 2017 Organization. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit
import PKHUD
import RSBarcodes_Swift
import AVFoundation

class SecondViewController: UIViewController {
    static let reuseID = "SecondViewController"
    
    fileprivate let viewModel = SecondViewModel()
    
    // I don't know why should we use this website
    var contents: String = "http://www.zai360.com/"
    
    @IBOutlet weak var imgDisplay: UIImageView!
    @IBOutlet weak var done: UIButton!
    @IBOutlet weak var QRCode: UIView!
    
    var onBack: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = contents
        
        bindViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let gen = RSUnifiedCodeGenerator.shared
        gen.fillColor = UIColor.white
        gen.strokeColor = UIColor.black
        print ("generating image with barcode: " + contents)
        if let image = gen.generateCode(contents, machineReadableCodeObjectType: AVMetadataObjectTypeQRCode) {
            self.imgDisplay.layer.borderWidth = 1
            self.imgDisplay.image = RSAbstractCodeGenerator.resizeImage(image, targetSize: self.imgDisplay.bounds.size, contentMode: UIViewContentMode.bottomRight)
        }
    }
}

extension SecondViewController {
    func bindViewModel() {
        
    }
}
