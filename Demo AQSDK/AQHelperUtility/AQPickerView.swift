//
//  AQPickerView.swift
//  Acquire-sdk
//
//  Created by SAFIQUL ISLAM on 07/12/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

import UIKit

class AQPickerView: UIPickerView,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var dataModel = [String]()
    var dataCallBack: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.delegate = self
        self.dataSource = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataModel.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataModel[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dataCallBack?(dataModel[row])
    }
}
