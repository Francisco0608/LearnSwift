//
//  TodosController.swift
//  Todos
//
//  Created by Peng Dewei on 2019/7/8.
//  Copyright © 2019 Peng. All rights reserved.
//

import UIKit

class TodosController: UITableViewController {
    
    var todos = [
        Todo(name: "A",check: false),
        Todo(name: "B", check: false),
        Todo(name: "C",check: false),
        Todo(name: "D",check: false),
        Todo(name: "E",check: false)
    ];
    
    var row = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem;
        editButtonItem.title = "编辑";
    }
    //如果editButtonItem执行 会调用这个方法
    override func setEditing(_ editing: Bool, animated: Bool) {
        //保证原有功能不消失的前提下 进行修改
        super.setEditing(editing, animated: animated);
        
        editButtonItem.title = isEditing ? "完成" : "编辑";
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath) as! TodoCell;
        cell.todo.text = todos[indexPath.row].name;
        cell.checkMark.text = todos[indexPath.row].check ? "√" : "";
        return cell
    }
    //当用户点击cell之后发生的事情
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // isEditing作为一个隐藏属性（如果点击左上角的edit按钮则为true）edit功能和我们的勾选功能相冲突则在这里进行区分
        if !isEditing{
            //关于换值
            todos[indexPath.row].check = !todos[indexPath.row].check;
            let cell = tableView.cellForRow(at: indexPath) as! TodoCell;
            cell.checkMark.text = todos[indexPath.row].check ? "√" : "";
            //取消选择cell时候把底色去掉
            tableView.deselectRow(at: indexPath, animated: true);
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    //关于编辑tableview
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //先从数组中删除
            todos.remove(at: indexPath.row);
            //视图中再删除
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        if editingStyle == .insert {
            
        }    
    }
    //将delete改为 删除 （返回值为string 直接返回“删除”即可）
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除";
    }

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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "addTodo"){
            let vc = segue.destination as! TodoController;
            vc.delegate = self;
        }
        
        if(segue.identifier == "editTodo"){
            let vs = segue.destination as! TodoController;
            let cell = sender as! TodoCell;
            row = tableView.indexPath(for: cell)!.row;
            vs.editValue = todos[row].name;
            vs.delegate = self;
        }
        
    }
 
}
extension TodosController: TodoDelegate{
    //在需要接收值的页面 重新定义方法
    func didAdd(name: String) {
        //此处将数据添加
        todos.append(Todo(name: name, check: false));
        //更新view section：代表单元格（cell）的第几个分区 row：代表分区的第几行
        let indexPath = IndexPath(row: todos.count - 1, section: 0);
        tableView.insertRows(at: [indexPath], with: .automatic);
    }
    //
    func didEdit(name: String) {
        //先将model中的name改掉
        todos[row].name = name;
        //再更新view
        let indexPath = IndexPath(row: row, section: 0);
        let cell = tableView.cellForRow(at: indexPath) as! TodoCell;
        cell.todo.text = name;
    }
    
}
