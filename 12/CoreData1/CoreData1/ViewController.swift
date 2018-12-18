//
//  ViewController.swift
//  CoreData1
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 sjj. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func add(_ sender: Any) {
        let person = Person(context: context)
        person.name = tfName.text
        person.phone = tfPhone.text
//        appDelegate.saveContext()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func update(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let person = try? context.fetch(fetch)
        if let p = person?.first{
            p.phone = tfPhone.text
//            appDelegate.saveContext()
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func del(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let person = try? context.fetch(fetch)
        if let p = person?.first{
            context.delete(p)
//            appDelegate.saveContext()
        }
        dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func query(_ sender: Any) {
//        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
//        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
//        let person = try? context.fetch(fetch)
//        if let p = person?.first{
//            tfPhone.text = p.phone
//        }
//    }
//
//
}

