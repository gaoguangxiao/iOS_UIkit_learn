//
//  ViewController.swift
//  004_UITableView
//
//  Created by 高广校 on 2024/3/27.
//

import UIKit

//UITableViewDiffableDataSource
//var dataSource = UITableViewDiffableDataSource<>
enum Section {
    case today
}

struct Note: Hashable {
    var idx: Int
    var content: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var noteList: Array<Note> = []
    
    private var dataSource: UITableViewDiffableDataSource<Section, Note>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // register cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        
        for i in 0..<5 {
            let note = Note(idx: i, content: "\(i)")
            noteList.append(note)
        }
        //        print("\(noteList)")
        self.dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = UITableViewCell()
            cell.textLabel?.text = itemIdentifier.content
            return cell
        })
        
        updateData(noteList)
    }
    
    @IBAction func 编辑(_ sender: Any) {
    
        self.tableView.isEditing = !self.tableView.isEditing
        
    }
    
    func 移动数据() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Note>()
        snapshot.appendSections([.today])
        snapshot.appendItems(noteList)
//        snapshot.moveItem(<#T##identifier: Note##Note#>, beforeItem: <#T##Note#>)
    }
    
    @IBAction func 插入数据(_ sender: Any) {
        
        let lastNote = self.noteList.last!
        
        noteList.append(Note(idx: lastNote.idx + 1, content: "\(lastNote.idx + 1)"))
//        noteList.append(Note(idx: lastNote.idx + 1, content: "\(lastNote.idx + 1)"))
        self.updateData(noteList)
//        self.dataSource?.tableView(tableView, canMoveRowAt: IndexPath)
    }
    
    func getDataSource() -> UITableViewDiffableDataSource<Section, Note>? {
        return UITableViewDiffableDataSource(tableView: self.tableView) { (tableView, indexPath, note) -> UITableViewCell? in
            let cell = UITableViewCell()
            cell.textLabel?.text = note.content
            return cell
        }
    }
    
    func updateData(_ noteList: [Note]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Note>()
        snapshot.appendSections([.today])
        snapshot.appendItems(noteList)
        self.dataSource?.apply(snapshot, animatingDifferences: false, completion: nil)
    }
}

extension ViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let note = self.noteList[indexPath.row]
//        
//        print("tap note: \(note.content)")
//    }
    
    // 长按菜单
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 允许那些菜单出现
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        
        return true
    }
    
    // 菜单操作
    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        print("action:\(action),indexpath：\(indexPath)")
    }
    
    // 删除代理
//    tablco
}

//@available(iOS 17.0, *)
//#Preview("Vc", body: {
//    return ViewController()
//})
