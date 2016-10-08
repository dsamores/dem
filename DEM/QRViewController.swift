/*
 * QRCodeReader.swift
 *
 * Copyright 2014-present Yannick Loriot.
 * http://yannickloriot.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

import UIKit
import AVFoundation

class QRViewController: UIViewController, QRCodeReaderViewControllerDelegate {
    lazy var reader = QRCodeReaderViewController(builder: QRCodeReaderViewControllerBuilder {
        $0.reader          = QRCodeReader(metadataObjectTypes: [AVMetadataObjectTypeQRCode])
        $0.showTorchButton = true
    })
    
    @IBAction func scanAction(_ sender: AnyObject) {
        if QRCodeReader.supportsMetadataObjectTypes() {
            reader.modalPresentationStyle = .formSheet
            reader.delegate               = self
            
            reader.completionBlock = { (result: QRCodeReaderResult?) in
                if let result = result {
                    print("Completion with result: \(result.value) of type \(result.metadataType)")
                }
            }
            
            present(reader, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Reader not supported by the current device", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - QRCodeReader Delegate Methods
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        let fullNameArr = result.value.components(separatedBy: "\n")
        
        let tel    = fullNameArr[0]
        let monto = fullNameArr[1]
        
        dismiss(animated: true) { [weak self] in
            let alert = UIAlertController(
                title: "Confirmar Pago",
                message: String (format:"Telefono: %@\nMonto: %@", tel, monto),
                preferredStyle: .alert
            )
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            let okAction = UIAlertAction(title: "OK", style: .default) {
                UIAlertAction in
                
                let url = NSURL(string: "http://172.141.20.181:8888/dem/rest.php?task=pago&telefono=" + tel + "&monto=" + monto)
                
                let task = URLSession.shared.dataTask(with: url! as URL) {(data, response, error) in
                    print(response)
                }
                
                task.resume()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {
                UIAlertAction in
                NSLog("Cancel Pressed")
            }
            
            // Add the actions
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    private func createReader() -> QRCodeReaderViewController {
        let builder = QRCodeReaderViewControllerBuilder { builder in
            builder.reader          = QRCodeReader(metadataObjectTypes: [AVMetadataObjectTypeQRCode])
            builder.showTorchButton = true
        }
        
        return QRCodeReaderViewController(builder: builder)
    }
}
