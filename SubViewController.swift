//
//  SubViewController.swift
//  PrimeTime
//
//  Created by Sudikoff Lab iMac on 7/23/16.
//  Copyright © 2016 PrimeTime. All rights reserved.
//

import TabPageViewController
import PagingMenuController

private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    private var componentType: ComponentType {
        return .All(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    private var pagingControllers: [UIViewController] {
        let viewController1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ImagesViewController")
        let viewController2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("GroupChatViewController")
        let viewController3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("OPChatViewController")
        return [viewController1, viewController2, viewController3]
    }
    
    private struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .SegmentedControl
        }
        var focusMode: MenuFocusMode {
            return .Underline(height: 3, color: UIColor(red: 140/255, green: 196/255, blue: 76/255, alpha: 1.0), horizontalPadding: 0, verticalPadding: 0)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(), MenuItem3()]
        }
    }
    
    private struct MenuItem1: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .Text(title: MenuItemText(text: "Images"))
        }
    }
    private struct MenuItem2: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .Text(title: MenuItemText(text: "Group"))
        }
    }
    private struct MenuItem3: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .Text(title: MenuItemText(text: "OP"))
        }
    }
}


class SubViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true;
        // Do any additional setup after loading the view, typically from a nib
        
        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        pagingMenuController.view.frame.origin.y += 64
        pagingMenuController.view.frame.size.height -= 64
        
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMoveToParentViewController(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LimitedButton(button: UIButton) {
        let tc = TabPageViewController.create()
        //let vc1 = UIViewController()
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ImagesViewController")
        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("GroupChatViewController")
        vc1.view.backgroundColor = UIColor.whiteColor()
        let vc3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("OPChatViewController")
        tc.tabItems = [(vc1, "Images"), (vc2, "Group"), (vc3, "OP")]
        var option = TabPageOption()
        option.tabWidth = view.frame.width / CGFloat(tc.tabItems.count)
        option.currentColor = UIColor(red: 140/255, green: 196/255, blue: 76/255, alpha: 1.0)
        tc.option = option
        navigationController?.pushViewController(tc, animated: true)
    }
}