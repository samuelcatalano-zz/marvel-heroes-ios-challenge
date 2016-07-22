//
//  ViewController.swift
//  Heroes
//
//  Created by Samuel D. N. Catalano on 7/21/16.
//  Copyright © 2016 Ginga One. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    let requestURL: NSURL = NSURL(string: "http://gateway.marvel.com/v1/public/characters/1009351/comics?ts=1&apikey=bb4470a46d0659a43c566ac6056ed48d&hash=479474cf0a28eac9998960da4d96f06b")!
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = NSArray();
    let defaultSize = "/portrait_medium"
    
    var hqNumber = Int()
    var hqImagePath = String()
    var hqImageExtension = String()
    
    
    // MARK: - Default methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch_async(dispatch_get_main_queue(), {
            let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: self.requestURL)
            let session = NSURLSession.sharedSession()
            
            let task = session.dataTaskWithRequest(urlRequest) {
                (data, response, error) -> Void in
                
                let httpResponse = response as! NSHTTPURLResponse
                let statusCode = httpResponse.statusCode
                
                if (statusCode == 200) {
                    
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                        let resut : NSMutableDictionary? = (json["data"] as? NSMutableDictionary)!
                        self.items = (resut!.valueForKey("results") as? NSArray)!
                        
                        self.collectionView.reloadData( )
                    }
                    catch {
                        print("Error with Json: \(error)")
                    }
                }
            }
            task.resume()
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Segue methods
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController;
        if  destination is ProfileViewController {
            if segue.identifier != nil {
                let profileViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileViewController") as? ProfileViewController
                self.presentViewController(profileViewController!, animated:true, completion:nil)
            }
        }
    }
    
    // MARK: - CollectionView methods
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        dispatch_async(dispatch_get_main_queue( ), {
            
            cell.hqImage.layer.borderWidth = 2
            cell.hqImage.layer.borderColor = UIColor.whiteColor().CGColor;
            
            self.collectionView.backgroundView = nil;
            self.collectionView.backgroundColor = UIColor.clearColor()
            
            let dic : NSMutableDictionary = self.items[indexPath.item] as! NSMutableDictionary;
            self.hqNumber = (dic["issueNumber"] as? Int)!
            let hqNumberStr = "#" + String(self.hqNumber)
            cell.hqNumber.text = hqNumberStr
            
            self.hqImagePath = (dic["thumbnail"]!["path"] as? String)!
            self.hqImageExtension = (dic["thumbnail"]!["extension"] as? String)!
            let hqImageURL = self.hqImagePath + self.defaultSize + "." + self.hqImageExtension;
            
            if let url = NSURL(string: hqImageURL) {
                if let data = NSData(contentsOfURL: url) {
                    cell.hqImage?.image = UIImage(data: data)
                }        
            }
        });
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
}