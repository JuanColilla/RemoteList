//
//  extension+ImageView.swift
//  TechnicalSkillTest
//
//  Created by Juan Colilla on 13/10/21.
//

import Foundation
import UIKit.UIImageView

extension UIImageView {
    
    func asyncLoadImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent("imageCache").absoluteString
        
        if !FileManager.default.fileExists(atPath: path) {
            try? FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        
        if let imageDataPath = Bundle.main.url(forResource: url, withExtension: nil, subdirectory: "imageCache") {
            do {
                let imageData = try Data(contentsOf: imageDataPath)
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
                return
            } catch {
                #if DEBUG
                print(error as Any)
                #endif
            }
        } else {
            URLSession.shared.dataTask(with: imageURL, completionHandler: { (data, response, error) in
                if error != nil {
                    #if DEBUG
                    print(error as Any)
                    #endif
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                    return
                }
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.image = image
                        try? data.write(to: FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent("imageCache/\(url)"))
                    } else {
                        #if DEBUG
                        print("Image could not be downloaded.")
                        #endif
                    }
                }
                
            }).resume()
        }
    }
}
