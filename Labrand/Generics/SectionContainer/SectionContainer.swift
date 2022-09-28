//
//  SectionContainer.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit

class SectionContainer {
    var sectionHandlers: [SectionHandler] = []
    
    init(handlers: [SectionHandler]) {
        self.sectionHandlers = handlers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionHandler = sectionHandlers[indexPath.row]
        return sectionHandler.tableView(tableView, cellForRowAt: indexPath)
    }
}
