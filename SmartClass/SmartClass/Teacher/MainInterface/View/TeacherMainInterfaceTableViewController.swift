//
//  TeacherMainInterfaceTableViewController.swift
//  SmartClass
//
//  Created by Vernon on 16/3/7.
//  Copyright © 2016年 Vernon. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class TeacherMainInterfaceTableViewController: UITableViewController, DZNEmptyDataSetSource
{
    var viewModel: TeacherMainInterfaceViewModel?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.emptyDataSetSource = self
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return viewModel!.numberOfItems()
    }
    
    // MARK: - actions
    
    @IBAction func createExaminationAction(sender: UIBarButtonItem)
    {
        let examViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ExaminationInformation") as! ExaminationInformationViewController
        examViewController.viewModel = viewModel?.editViewModelForNewExam()
        navigationController?.pushViewController(examViewController, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "createExamination" {
            if let examViewController = segue.destinationViewController as? ExaminationInformationViewController {
                examViewController.viewModel = viewModel?.editViewModelForNewExam()
            }
        }
    }
    
    // MARK: - DZNEmptyDataSet data source
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage!
    {
        return UIImage(named: "place_logo")
    }
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString!
    {
        let text = NSLocalizedString( "欢迎来到智慧课堂", comment: "" )
        let attributes = [NSFontAttributeName : UIFont.boldSystemFontOfSize(22.0) ,
            NSForegroundColorAttributeName : UIColor.darkGrayColor()]
        
        return NSAttributedString(string: text , attributes: attributes)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString!
    {
        
        let text = NSLocalizedString( "🏃🏻点击右上角 + 开始创建试卷", comment: "" )
        let attributes = [NSFontAttributeName : UIFont.boldSystemFontOfSize(17.0) ,
            NSForegroundColorAttributeName : UIColor.lightGrayColor()]
        
        return NSAttributedString(string: text , attributes: attributes)
    }
    
}
