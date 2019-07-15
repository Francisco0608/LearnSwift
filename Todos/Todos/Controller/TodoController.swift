//
//  TodoController.swift
//  Todos
//
//  Created by Peng Dewei on 2019/7/11.
//  Copyright © 2019 Peng. All rights reserved.
//

import UIKit

//涉及跨界面传值 先定义delegate
protocol TodoDelegate {
    //是否添加任务
    func didAdd(name: String);
    //是否编辑任务
    func didEdit(name: String);
}

class TodoController: UITableViewController {
    //初始化delegate
    var delegate: TodoDelegate?;
    
    //通过编辑按钮 从主界面传过来的值
    var editValue: String?;
    
   //界面输入框
    @IBOutlet weak var todoInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //界面打开时，将光标转移到textbox中
        todoInput.becomeFirstResponder();
        
        //点击编辑，从界面传值
        todoInput.text = editValue;
        if(editValue != nil){
            self.navigationItem.title = "编辑任务";
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    //界面确定键
    @IBAction func done(_ sender: Any) {
        if let name = todoInput.text,!name.isEmpty{
            if (editValue != nil){
                delegate?.didEdit(name: name);
            }else{
                delegate?.didAdd(name: name);
            }
        }
        //完成操作之后 让本页面出栈 类似于dismiss
        navigationController?.popViewController(animated: true);
    }
    
    /*
    // MARK: - Table view data source 因为是静态的 以下方法不需要

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
