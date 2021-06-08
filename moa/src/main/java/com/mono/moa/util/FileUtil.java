package com.mono.moa.util;

import java.io.File;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import com.mono.moa.vo.FileVO;

public class FileUtil {

	public String rename(String path, String oldName) {
		int count = 0;
		String tmpName = oldName;
		int len = tmpName.lastIndexOf(".");
		String preStr = tmpName.substring(0, len);
		String suffStr = tmpName.substring(len);
		
		File file = new File(path, oldName);
		while(file.exists()) {
			count++;
			oldName = preStr + "(" + count + ")" + suffStr;
			file = new File(path, oldName);
		}
		return oldName;
	}
	
	public ArrayList<FileVO> saveProc(MultipartFile[] file, int bno, String dir){
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		String path = this.getClass().getResource("").getPath();
		System.out.println(path);
		path = path.substring(0, path.indexOf("/WEB-INF")) + "/WEB-INF/resources" + dir;
		System.out.println(path);
		try {
			for(int i=0; i < file.length; i++) {
				FileVO fVO = new FileVO();
				String oriName = file[i].getOriginalFilename();
				if(oriName == null) {
					continue;
				}
			String saveName = rename(path, oriName);
			fVO.setOriname(oriName);
			fVO.setSavename(saveName);
			fVO.setLen(file[i].getSize());
			fVO.setDir(dir);
			fVO.setBno(bno);
			list.add(fVO);
			File tmp = new File(path, saveName);
			file[i].transferTo(tmp);	
			}
		} catch (Exception e) {}
		return list;
	}
}
