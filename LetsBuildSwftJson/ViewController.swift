//
//  ViewController.swift
//  LetsBuildSwftJson
//
//  Created by Mahaboobsab Nadaf on 13/11/17.
//  Copyright © 2017 NeoRays. All rights reserved.
//

import UIKit

struct WebsiteDescription : Decodable{
    let name : String
    let description : String
    let courses : [Course]
    
    
    
}

struct Course : Decodable{
    
    let id : Int?
    let name : String?
    let link  : String?
    let imageUrl  :String?
    
//    let id : Int
//    let name : String
//    let link  : String
//    let imageUrl  :String
    
//    init(json : [String : Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//
//    }
    
}




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//let myCourse  = Course (id : 100, name : "My COurse", link : "My Link", imageUrl : "Some Image Url")
        
      //  print(myCourse)
        
       // let jsonUrlString = "http://api.letsbuildthatapp.com/jsondecodable/courses"
       
        
        let jsonUrlString = "http://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        
        
       //let jsonUrlString =  "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        
        
        //let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        
        guard let url = URL(string : jsonUrlString) else{
            return
            
        }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            //Perhaps Check Error
            
            //Also check 200 OK
            
           // print("Do Stup Here")
            
            
            guard let data = data else {
                return
            }
            
//            let dataAsString = String(data : data, encoding : .utf8)
//
//            print(dataAsString)
            
            do{
               // let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)

               // print(websiteDescription.name, websiteDescription.description)
               // print(websiteDescription.courses)
                
                //let course = try JSONDecoder().decode(Course.self, from: data)
//
                 let courses = try JSONDecoder().decode([Course].self, from: data)

                print(courses)
                
                
                //Swift 2/3/ Objective c
//                guard  let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any] else {
//                    return
//                }
//
//                let course = Course(json : json)
//
//                print(course.name)
                
                
                
            }catch let jsonError{
                
                print("Error serializing json : ",jsonError)
            }
            
          
            
        }.resume()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

