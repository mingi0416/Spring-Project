package com.sp.ex;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/1uploadForm",method=RequestMethod.GET)
	public void uploadFormGet() {
		
	}
	
	@RequestMapping(value="/test",method=RequestMethod.POST)
	public String test(MultipartFile file,Model model) throws Exception {
		System.out.println("테스트");

		return "2uploadResult";
	}
	
	@RequestMapping(value="/1uploadForm",method=RequestMethod.POST)
	public String uploadFormPost(MultipartFile[] file,Model model) throws Exception {
		//fileUpload작업
		for (MultipartFile file1 : file) {
		System.out.println("multipartFile 정보");
		System.out.println(file1.getOriginalFilename());
		System.out.println(file1.getSize());
		System.out.println(file1.getContentType());
		
		String savedName=uploadFile(file1.getOriginalFilename(),file1.getBytes());
		model.addAttribute("savedName",savedName);
		}

		return "2uploadResult";
	}

	private String uploadFile(String originalFilename, byte[] bytes) throws Exception {
		UUID uid=UUID.randomUUID();
		String savedName=uid.toString()+"_"+originalFilename;
		File target=new File(uploadPath,savedName);
		FileCopyUtils.copy(bytes, target);
		return savedName;
	}
	
	

	@RequestMapping(value = "/3uploadForm2", method = RequestMethod.GET)
	public void uploadForm2() {
	}

	@RequestMapping(value = "/3uploadForm2", method = RequestMethod.POST)
	public String uploadFormPost2(MultipartFile file1, MultipartFile file2, Model model) throws Exception {
		System.out.println("/uploadForm 파일정보");
		System.out.println(file1.getOriginalFilename());
		System.out.println(file1.getSize());
		System.out.println(file1.getContentType());

		String savedName = uploadFile(file1.getOriginalFilename(), file1.getBytes());
		model.addAttribute("savedName", savedName);

		System.out.println("/uploadForm 파일정보");
		System.out.println(file2.getOriginalFilename());
		System.out.println(file2.getSize());
		System.out.println(file2.getContentType());

		String savedName2 = uploadFile(file2.getOriginalFilename(), file2.getBytes());
		model.addAttribute("savedName2", savedName2);
		return "2uploadResult";

	}

	@RequestMapping(value = "/3uploadForm3", method = RequestMethod.POST)
	public String uploadFormPost3(@RequestParam("file") MultipartFile[] file, Model model) throws Exception {

		for (MultipartFile file1 : file) {
			System.out.println("/uploadForm 파일정보3");
			System.out.println(file1.getOriginalFilename());
			System.out.println(file1.getSize());
			System.out.println(file1.getContentType());

			String savedName = uploadFile(file1.getOriginalFilename(), file1.getBytes());
			model.addAttribute("savedName", savedName);
		}
		return "2uploadResult";

	}
	@RequestMapping(value = "/4uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {
		
	}
	

	@ResponseBody
	@RequestMapping(value = "/4uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		System.out.println("originalName: " + file.getOriginalFilename());
		String savedName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		// SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_");
		SimpleDateFormat formatter = new SimpleDateFormat("YYYYMM");
		Calendar now = Calendar.getInstance();

		String yearPath = formatter.format(now.getTime());
		String savedPath = uploadPath + "////" + yearPath;

		System.out.println(savedPath);
		File makeFolder = new File(savedPath);
		// folderPath의 디렉토리가 존재하지 않을경우 디렉토리 생성.
		if (!makeFolder.exists()) {
			makeFolder.mkdir();
			System.out.println("폴더를 생성합니다.");
		}
		// 파일저장
		File target = new File(savedPath, savedName);
		FileCopyUtils.copy(file.getBytes(), target);

		String formatName = savedName.substring(savedName.lastIndexOf(".") + 1).toUpperCase();
		System.out.println(formatName);
		String uploadedFileName = null;
		if (formatName.equals("JPG") || formatName.equals("PNG") || formatName.equals("GIF")) {
			uploadedFileName = makeThumbnail(savedPath, yearPath, savedName);
		} else {
			uploadedFileName = "////" + yearPath + "////" + savedName;
		}
		System.out.println(uploadedFileName);
		return new ResponseEntity<>(uploadedFileName, HttpStatus.CREATED);
	}

	private static String makeThumbnail(String savedPath, String yearPath, String fileName) throws Exception {

		BufferedImage sourceImg = ImageIO.read(new File(savedPath, fileName));

		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);

		String thumbnailName = savedPath + "////" + "s_" + fileName;

		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		return "////" + yearPath + "////" + thumbnailName.substring(savedPath.length() + 2);
	}


	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		System.out.println("displayFileE: " + fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase();
			MediaType mType = null;
			if (formatName.equals("JPG")) {
				mType = MediaType.IMAGE_JPEG;
			} else if (formatName.equals("GIF")) {
				mType = MediaType.IMAGE_GIF;
			} else if (formatName.equals("PNG")) {
				mType = MediaType.IMAGE_PNG;
			}
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			if (fileName.contains("s_")) {
				headers.setContentType(mType);
				System.out.println("displayFileE: 2" + fileName);
			} else {
				System.out.println("displayFileE: 3" + fileName);
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\""
				+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")
				+ "\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {

		System.out.println("delete file: " + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase();

		if (formatName.equals("JPG") || formatName.equals("PNG") || formatName.equals("GIF")) {
			System.out.println(uploadPath + fileName.replace("s_", ""));
			new File(uploadPath + fileName.replace("s_", "")).delete();

		} else {

		}

		new File(uploadPath + fileName).delete();
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/5uploadAjaxM", method = RequestMethod.GET)
	public void uploadAjaxM() {
	}

	@ResponseBody
	@RequestMapping(value = "/5uploadAjaxM", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjaxM(@RequestParam("file") MultipartFile[] file) throws Exception, Exception {
		String savedName=null;
		for (MultipartFile file1 : file) {
			System.out.println("/uploadForm 파일정보3");
			System.out.println(file1.getOriginalFilename());
			System.out.println(file1.getSize());
			System.out.println(file1.getContentType());

			savedName = uploadFile(file1.getOriginalFilename(), file1.getBytes());
		}

		return new ResponseEntity<>(savedName, HttpStatus.CREATED);
	}

}





















