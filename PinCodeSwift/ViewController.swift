/**
* Copyright 2016 IBM Corp.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import UIKit
import IBMMobileFirstPlatformFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var balanceLabelInfo: UILabel!
    
    @IBOutlet weak var copyrightLblInfo: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.copyrightLblInfo.text = "©\(appDelegate.currentYear) Persistent System"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getBalanceFunc(_ sender: UIButton) {
        let request = WLResourceRequest(url: URL(string: "/adapters/ResourceAdapter/balance"), method: WLHttpMethodGet)
        request?.send { (response, error) -> Void in
            if(error == nil){
                NSLog((response?.responseText)!)
                self.balanceLabelInfo.text = "Balance = " + (response?.responseText)!

            }
            else{
                NSLog(error.debugDescription)
                self.balanceLabelInfo.text = "Failed to get balance"
            }
        }

    }

}
