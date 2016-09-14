import UIKit

class ViewController: UIViewController {

    // 定义完成回调属性
    
    // 闭包的返回值可选
//    var finishedCallBack: ()->()?
    // 闭包属性可选
    var finishedCallBack: ((html: String)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 方法三：Swift 的方法2
        // [unowned self] 表示闭包中的 self 都是 assign -> 如果 self 被释放，闭包中的 self 的地址不会修改
        // 与__unsafe_unretained类似，如果 self 被释放，同样会出现野指针
        loadData { [unowned self] (html) -> () in
            print(html)
            // self? 表示对象一旦被释放，不再访问其属性或者方法
            print(self.view)
        }
    }
    
    func demo2() {
        // 方法二：Swift 的方法1
        // [weak self] 表示闭包中的 self 都是 弱引用
        // 与 __weak 类似，如果 self 被释放，什么也不做，更安全
        loadData { [weak self] (html) -> () in
            print(html)
            // self? 表示对象一旦被释放，不再访问其属性或者方法
            print(self?.view)
        }
    }
    
    // 方法一：OC 的传统方法
    func demo1() {
        // weak 属性在运行时可能会被改变 -> 执行对象一旦被释放，变成 nil
        // weak 属性不能是 let
        weak var weakSelf = self
        
        loadData { (html) -> () in
            print(html)
            // 闭包中，一定要使用 self.
            // weakSelf? 表示对象一旦被释放，不再访问其属性或者方法
            print(weakSelf?.view)
        }
    }
    
    deinit {
        print("控制器 88")
    }

    // 闭包应用场景：异步操作完成后，通过闭包的参数传递网络请求结果
    func loadData(finished: (html: String) -> ()) {
        
        // 1. 记录完成回调
        finishedCallBack = finished
        
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            print("模拟异步加载数据")
            
            // 主线程回调
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                print("主线程回调")
                
                // 如果回调不能在当前方法立即执行，可以通过属性记录，在需要的时候用执行
//                finished(html: "<html>")
                self.finishedCallBack?(html: "hahah")
            })
        }
    }
}