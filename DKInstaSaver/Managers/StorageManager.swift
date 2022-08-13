//
//  StorageManager.swift
//  DKInstaSaver
//
//  Created by Dksh on 07/08/22.
//

import Foundation

class StorageManager {
    static let shared: StorageManager = StorageManager()
    
    let fileManager: FileManager = FileManager.default
    lazy var documentDir: URL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    lazy var mediaPath: URL = documentDir.appendingPathComponent("Medias")
    
//    func saveFile(filePath: URL) {
//        createDirectory()
//
//        guard let mediaPath = mediaPath else { return }
//        DSLog.log("filePath from: \(filePath.path)")
//
//        do {
//            try fileManager.moveItem(at: filePath, to: mediaPath)
//            DSLog.log("filePath to: \(filePath.path) success")
//        } catch {
//            DSLog.log("error: \(error.localizedDescription)")
//        }
//    }
    
    func saveFile(fromPath: URL, fileName: String) {

        let toPath: URL = mediaPath.appendingPathComponent(fileName)
        DSLog.log("\(#function) fromPath: \(fromPath.path), toPath: \(toPath.path)")

        let folderPath = toPath.deletingLastPathComponent()
        createDirectory(folderPath: folderPath)
        
        do {
            try fileManager.moveItem(at: fromPath, to: toPath)
            DSLog.log("folderPath moveItem success: \(toPath.path)")
            
            ProgressHUDManager.showProgress(message: "Media saved successfully", type: .success)
        } catch CocoaError.fileWriteFileExists {
            // file already exists. Delete the old directory and try again.
            DSLog.log("file already exists")

            let renameFileName = (toPath.deletingPathExtension().lastPathComponent + "~\(Int(Date().timeIntervalSince1970))")
                .urlPath
                .appendingPathExtension(toPath.pathExtension)
                .lastPathComponent
            saveFile(fromPath: fromPath, fileName: renameFileName)
        } catch {
            DSLog.log("error: \(error)")
            ProgressHUDManager.showProgress(message: "Media saving error: \(error.localizedDescription)")
        }
    }
    
    func createDirectory(folderPath: URL) {
        DSLog.log("folderPath: \(folderPath.path)")
        
        guard !fileManager.fileExists(atPath: folderPath.path) else { return }
        
        do {
            try fileManager.createDirectory(at: folderPath, withIntermediateDirectories: true, attributes: nil)
            DSLog.log("folderPath createDirectory success")
        } catch {
            DSLog.log("error: \(error.localizedDescription)")
        }
    }
}
