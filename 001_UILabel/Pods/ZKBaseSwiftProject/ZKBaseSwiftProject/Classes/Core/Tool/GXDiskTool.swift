//
//  ZKDiskTool.swift
//  ZKBaseSwiftProject
//
//  Created by 高广校 on 2024/1/3.
//

import Foundation

public class ZKDiskTool: NSObject{
    
    public static let shared = ZKDiskTool()
    
    var audiosCachePath: String {
        return (FileManager.cachesPath ?? "") + "/Record/"
    }
    
    //在Caches文件下创建指定文件夹
    public func createFolder(name: String) -> String? {
        guard let cache = FileManager.cachesPath else { return nil }
        let folderPath = cache + "/\(name)"
        let status = FileManager.createFolder(atPath: folderPath)
        return status ? folderPath : nil
    }
    
    public func createAudioRecordpath(path:String ,fileExt: String) -> String {
        
        let filePath = audiosCachePath + path.stringByDeletingLastPathComponent
        
        FileManager.createFolder(atPath:filePath)

        return filePath + "/" + "\(getAudioName(path))" + "." + "\(fileExt)"
    }
}

/// 音频文件
public extension ZKDiskTool {
    
    func createRecordAudioPathAndRemoveOldPath(path:String ,fileExt: String) -> String {
        let recordPath = self.createAudioRecordpath(path: path, fileExt: fileExt)
        //判断音频文件是否存在，移除旧音频文件
        if FileManager.isFileExists(atPath: recordPath) {
            FileManager.removefile(atPath: recordPath)
        }
        return recordPath
    }
    
    func getAudioCachePath(_ path:String) -> String {
        return audiosCachePath + path + "\(getAudioName(path))"
    }
    
    /// 带文件类型
    func getAudioCacheLocalPath(_ path:String) -> String {
        return audiosCachePath + path
    }
    
    func getAudioName(_ path:String) -> String {
        return path.lastPathComponent
    }
    
    func clearAudiosCache(path: String) -> Bool{
        let filePath = getAudioCacheLocalPath(path)
        return FileManager.removefile(atPath: filePath)
    }
    
    func clearAudiosCache() -> Bool{
        return FileManager.removefolder(atPath: audiosCachePath)
    }
}
