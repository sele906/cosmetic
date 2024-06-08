package com.example.cosmetic.controller.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.cosmetic.model.review.ReviewService;
import com.example.cosmetic.util.UploadFileUtils;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;


@Controller
public class AjaxUploadController {

	@Autowired
	ReviewService reviewService;
	
	

    String upload_path = "src/main/webapp/resources/admin/img";
    
	@GetMapping("/upload/ajax_form")
	public String upload_form() {
		return "/upload/ajax_form";
	}

	@ResponseBody
	@RequestMapping(value = "/upload/ajax_upload", produces="text/palin;charset=utf-8")
	public ResponseEntity<List<String>> ajax_upload(@RequestParam(name = "file") MultipartFile[] files) throws Exception {
//		String filename = UploadFileUtils.uploadFile(upload_path, file.getOriginalFilename(), file.getBytes());
//		System.out.println("filname:"+filename);
//		return new ResponseEntity<String>(filename, HttpStatus.OK);
		List<String> filenames = new ArrayList<>();
        for (MultipartFile file : files) {
            String filename = UploadFileUtils.uploadFile(upload_path, file.getOriginalFilename(), file.getBytes());
            //System.out.println("filename:" + filename);
            filenames.add(filename);
        }
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        return new ResponseEntity<>(filenames, headers, HttpStatus.OK);
    }

	@ResponseBody
	@GetMapping("/upload/display_file")
	public ResponseEntity<byte[]> display_file(@RequestParam(name = "file_name") String file_name) {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(file_name);
			file_name = file_name.substring(file_name.indexOf("_") + 1);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment; filename=\"" + file_name + "\"");
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return entity;
	}

//	@ResponseBody
//	@RequestMapping(value = "/upload/delete_file", method = RequestMethod.POST)
//	public ResponseEntity<String> delete_file(String file_name) {
//		new File(upload_path + file_name.replace("/", File.separator)).delete();
//		                        //          /(슬래시) 를  \(백슬래시) 로 바꾸고 지워라
//		reviewService.delete_attach(file_name);
//		return new ResponseEntity<String>("deleted", HttpStatus.OK);
//	}
}