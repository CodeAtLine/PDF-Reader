//
//  PDFListViewController.swift
//  PDF Reader
//
//  Created by Chintan Dave on 20/10/16.
//  Copyright © 2016 ILearniOS. All rights reserved.
//

/*
 Resource to render PDFs
 https://developer.apple.com/library/content/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/dq_pdf/dq_pdf.html
 https://www.cocoanetics.com/2010/06/rendering-pdf-is-easier-than-you-thought/

 https://www.symantec.com/content/dam/symantec/docs/reports/istr-21-2016-en.pdf
 https://www.nasa.gov/pdf/363296main_Space_Thrills_Poster_Back.pdf
 https://solarsystem.nasa.gov/docs/000-SolarSystemLithosCombined_Rev1_FC.pdf
 https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/228842/8082.pdf
 http://www.arvindguptatoys.com/arvindgupta/101ways.pdf
 http://www.mcafee.com/us/resources/reports/rp-quarterly-threats-mar-2016.pdf
 http://www.nationalgeographic.com/mediakit/pdf/ng-kids/NGK_Media_Kit_2016.pdf
 http://www.oreilly.com/programming/free/files/2016-european-software-development-salary-survey.pdf
 */

import UIKit

class PDFListViewController: UITableViewController
{
    var localPDFURLs:[URL] = []
    var remotePDFURLs:[URL] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        localPDFURLs.append(Bundle.main.url(forResource: "HelpPlanetEarth", withExtension: "pdf")!)
        localPDFURLs.append(Bundle.main.url(forResource: "National Geographic Kids", withExtension: "pdf")!)
        localPDFURLs.append(Bundle.main.url(forResource: "TheNaturalChoice", withExtension: "pdf")!)
        localPDFURLs.append(Bundle.main.url(forResource: "OurSolarSystem2", withExtension: "pdf")!)
        localPDFURLs.append(Bundle.main.url(forResource: "ThreatsReport", withExtension: "pdf")!)
        
        remotePDFURLs.append(URL(string: "https://www.symantec.com/content/dam/symantec/docs/reports/istr-21-2016-en.pdf")!)
        remotePDFURLs.append(URL(string: "http://www.oreilly.com/programming/free/files/2016-european-software-development-salary-survey.pdf")!)
        remotePDFURLs.append(URL(string: "https://www.nasa.gov/pdf/363296main_Space_Thrills_Poster_Back.pdf")!)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let PDFVC:PDFViewController = self.storyboard?.instantiateViewController(withIdentifier: "PDFViewController") as! PDFViewController
        
        if indexPath.section == 0
        {
            PDFVC.localPDFURL = localPDFURLs[indexPath.row]
        }
        else
        {
            PDFVC.remotePDFURL = remotePDFURLs[indexPath.row]
        }
        
        self.navigationController?.pushViewController(PDFVC, animated: true)
    }
}
