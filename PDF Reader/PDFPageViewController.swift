//
//  PDFPageViewController.swift
//  PDF Reader
//
//  Created by Chintan Dave on 23/09/16.
//  Copyright © 2016 ILearniOS. All rights reserved.
//

import UIKit

class PDFPageView: UIView
{
    var PDFDocument:CGPDFDocument? = nil
    var pageNumber:Int? = nil;
    
    override func draw(_ rect: CGRect)
    {
        if PDFDocument != nil
        {
            let ctx = UIGraphicsGetCurrentContext()
            
            UIColor.white.set()
            ctx?.fill(rect)

            _ = ctx?.ctm
            _ = ctx?.scaleBy(x: 1, y: -1)
            _ = ctx?.translateBy(x: 0, y: -rect.size.height)
            
            let page = PDFDocument?.page(at: pageNumber!)
            
            let pageRect = page?.getBoxRect(CGPDFBox.cropBox)
            
            let ratioW = rect.size.width / (pageRect?.size.width)!
            let ratioH = rect.size.height / (pageRect?.size.height)!
            
            let ratio = min(ratioW, ratioH)
            
            let newWidth = (pageRect?.size.width)! * ratio;
            let newHeight = (pageRect?.size.height)! * ratio;
            
            let offsetX = (rect.size.width - newWidth);
            let offsetY = (rect.size.height - newHeight);
            
            ctx?.scaleBy(x: newWidth / (pageRect?.size.width)!, y: newHeight / (pageRect?.size.height)!)
            ctx?.translateBy(x: -(pageRect?.origin.x)! + offsetX, y: -(pageRect?.origin.y)! + offsetY)
            
            ctx?.drawPDFPage(page!)
        }
    }
}

class PDFPageViewController: UIViewController, UIScrollViewDelegate
{
    var PDFDocument:CGPDFDocument? = nil
    var pageNumber:Int? = nil;

    @IBOutlet weak var page: PDFPageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.preparePDFPage()
    }
    
    func preparePDFPage()
    {
        page.PDFDocument = self.PDFDocument
        page.pageNumber  = self.pageNumber
        
        page.setNeedsDisplay()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return page
    }
}
