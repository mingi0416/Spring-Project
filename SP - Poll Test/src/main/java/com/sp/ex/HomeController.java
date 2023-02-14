package com.sp.ex;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sp.dto.BoardDTO;
import com.sp.dto.ReplyDTO;
import com.sp.dto.SPDto;
import com.sp.dto.UploadDTO;
import com.sp.service.BoardModel;
import com.sp.service.ISPService;
import com.sp.service.ReplyService;
import com.sp.service.UploadService;
import com.sp.vo.PageMaker;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	  private BoardModel bm;
	@Inject
	  private ReplyService rs;
	@Autowired
	private ISPService service;
	@Autowired
	private UploadService us;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String start(Locale locale, Model model) {
		logger.info("MainPage or SignIn page will start", locale);
		
		return "signIn";
	}

	@RequestMapping(value = "/tosignUp", method = RequestMethod.GET)
	public String toSignUp(Locale locale, Model model) {
		logger.info("SignUp Page", locale);

		
		return "signUp";
	}
	
	@RequestMapping(value = "/check_id", method = RequestMethod.GET)
	@ResponseBody
	public int check_id(@RequestParam("id") String id) throws Exception {
		int cnt = service.check_id(id);
		return cnt;
	}
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String SignUp(Locale locale, SPDto vo) throws Exception {
		logger.info("Success signUp", locale);
		service.signUp(vo);
		service.insert_authority(vo.getId());
		System.out.println(vo);
		return "signIn";
	}
	
	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String userLogin(Locale locale, Model model) {
		
		return "/signIn";
	}
	
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String userError(Locale locale, Model model) {
		return "/error";
	}
	
	
	@RequestMapping(value = "/forgot", method = RequestMethod.GET)
	public String tofind_info(Locale locale, Model model) {
		logger.info("find_info", locale);
		return "/find_info";
	}
	
	@RequestMapping(value = "/find_id", method = RequestMethod.GET)
	public String find_id(Locale locale, SPDto dto, Model model) throws Exception {
		logger.info("Success find_id", locale);
		String id = service.find_id(dto);
		System.out.println(id);
		model.addAttribute("id",id);
		return "/find_info";
	}
	
	@RequestMapping(value = "/find_pw", method = RequestMethod.GET)
	public String find_pw(Locale locale, SPDto dto, Model model) throws Exception {
		logger.info("Success find_pw", locale);
		String pw = service.find_pw(dto);
		System.out.println(pw);
		model.addAttribute("pw",pw);
		return "/find_info";
	}
	
	@RequestMapping(value = "/info_delete", method = RequestMethod.GET)
	public String info_delete(Locale locale, SPDto dto, Model model, Authentication authentication) throws Exception {
		logger.info("Success info_delete", locale);
		UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken)authentication;
		String id = token.getName();
		System.out.println(id);
		model.addAttribute("id",id);
		service.info_delete(id);
		return "/signIn";
	}
	
	@RequestMapping(value = "/toInfo_update", method = RequestMethod.GET)
	public String toInfo_update(Locale locale, SPDto dto, Model model, Authentication authentication) throws Exception {
		logger.info("To info_update page", locale);
		UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken)authentication;
		String id = token.getName();
		System.out.println(id);
		model.addAttribute("id",id);
		SPDto info = service.select_info(id);
		System.out.println(info);
		model.addAttribute("pw", info.getPw());
		model.addAttribute("name", info.getName());
		model.addAttribute("birth", info.getBirth());
		model.addAttribute("postcode", info.getPostcode());
		model.addAttribute("address1", info.getAddress1());
		model.addAttribute("address2", info.getAddress2());
		model.addAttribute("phone", info.getPhone());
		return "/info_update";
	}
	
	@RequestMapping(value = "/info_update", method = RequestMethod.GET)
	public String info_update(Locale locale, SPDto dto, Model model) throws Exception {
		logger.info("To info_update page", locale);
		service.info_update(dto);
		return "redirect:/success";
	}
	
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, ReplyDTO reply,
			BoardDTO board, UploadDTO upload, PageMaker pm,Model model, Authentication authentication) throws Exception {
		System.out.println(pm);
		model.addAttribute(bm.read(bno));
		model.addAttribute("bno", bno);
		bm.update_vct(board.getBno());
		UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken)authentication;
		String writer = token.getName();
		System.out.println(writer);
		model.addAttribute("writer",writer);
		String authority = bm.select_authority(writer);
		model.addAttribute("authority",authority);
		System.out.println(authority);
		
		List<ReplyDTO> replyList = rs.reply_list(bno);
		model.addAttribute("replyList", replyList);
		System.out.println("덧글:"+replyList);
		List<UploadDTO> imageList = us.getFiles(bno);
		model.addAttribute("imageList", imageList);
		System.out.println("이미지:"+imageList);

		//return "/sboard/read
	}
	
	@RequestMapping(value = "/toWrite", method = RequestMethod.GET)
	public String toWrite(Locale locale, Model model,Authentication authentication) {
		logger.info("To write Page", locale);
		UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken)authentication;
		String writer = token.getName();
		System.out.println(writer);
		model.addAttribute("writer",writer);
		
		return "write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Locale locale, BoardDTO vo, MultipartFile[] file) throws Exception {
		logger.info("Success write", locale);
		bm.write(vo);
		

		SimpleDateFormat formatter = new SimpleDateFormat("YYYYMM");
		Calendar now = Calendar.getInstance();

		String yearPath = formatter.format(now.getTime());
		String savedPath =  "C:\\SPFile";

		System.out.println(savedPath);
		File makeFolder = new File(savedPath);
		if (!makeFolder.exists()) {
			makeFolder.mkdir();
			System.out.println("폴더를 생성합니다.");
		}

		
		for (MultipartFile file1 : file) {
			
		String savedName = System.currentTimeMillis() + "_" + file1.getOriginalFilename();
			
		System.out.println("multipartFile 정보");
		System.out.println(file1.getOriginalFilename());
		System.out.println(file1.getSize());
		System.out.println(file1.getContentType());
		
		// 파일저장
		File target = new File(savedPath, savedName);
		FileCopyUtils.copy(file1.getBytes(), target);
		
		us.addFile(savedName);
		}
	//	System.out.println("파일명입니다:"+);
		System.out.println(vo);
		return "redirect:/success";
	}
	
	
	
//	@RequestMapping(value = "/write", method = RequestMethod.GET)
//	public String write(Locale locale, BoardDTO vo) throws Exception {
//		logger.info("Success write", locale);
//		bm.write(vo);
//	//	System.out.println("파일명입니다:"+);
//		System.out.println(vo);
//		return "redirect:/success";
//	}
//	
	
	
	@RequestMapping(value = "/toRewrite", method = RequestMethod.GET)
	public String toRewrite(@RequestParam("grpno") int grpno,@RequestParam("depth") int depth,@RequestParam("grpord") int grpord ,Locale locale, Model model,Authentication authentication) {
		logger.info("To rewrite Page", locale);
		UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken)authentication;
		String writer = token.getName();
		System.out.println(writer);
		model.addAttribute("writer",writer);
		model.addAttribute("grpno",grpno);
		model.addAttribute("depth",depth);
		model.addAttribute("grpord",grpord);
		return "rewrite";
	}
	
	@RequestMapping(value = "/rewrite", method = RequestMethod.GET)
	public String rewrite(Locale locale, BoardDTO vo) throws Exception {
		logger.info("Success write", locale);
		bm.create_re(vo);
		System.out.println(vo);
		return "redirect:/success";
	}
	
	
	@RequestMapping(value = "/toModify", method = RequestMethod.GET)
	public String toModify(Locale locale,BoardDTO board, PageMaker pm,Model model) throws Exception {
		logger.info("To Modify Page", locale);
		System.out.println(pm);
		model.addAttribute("board", board);
		
		return "modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(Locale locale, BoardDTO vo) throws Exception {
		logger.info("Success modify", locale);
		bm.modify(vo);
		System.out.println(vo);
		return "redirect:/success";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String remove(Locale locale, BoardDTO vo, @RequestParam("bno") int bno) throws Exception {
		logger.info("Success remove", locale);
		bm.remove(bno);
		rs.deleteBno(bno);
		System.out.println(bno);
		return "redirect:/success";
	}
	
	@RequestMapping(value = "/insert_reply", method = RequestMethod.GET)
	public String insert_reply(Locale locale, ReplyDTO vo, @RequestParam("bno") int bno) throws Exception {
		logger.info("Success Insert reply", locale);
		rs.insert_reply(vo);
		System.out.println(vo);
		return "redirect:/read?bno="+bno;
	}
	
	@RequestMapping(value = "/insert_reply_re", method = RequestMethod.GET)
	public String insert_reply_re(Locale locale, ReplyDTO vo, @RequestParam("bno") int bno) throws Exception {
		logger.info("Success Insert reply", locale);
		rs.insert_reply_re(vo);
		System.out.println(vo);
		return "redirect:/read?bno="+bno;
	}
	
	@RequestMapping(value = "/update_reply", method = RequestMethod.GET)
	public String update_reply(Locale locale, ReplyDTO vo, @RequestParam("bno") int bno) throws Exception {
		logger.info("Success Update reply", locale);
		rs.update_reply(vo);
		System.out.println(vo);
		return "redirect:/read?bno="+bno;
	}
	
	@RequestMapping(value = "/delete_reply", method = RequestMethod.GET)
	public String delete_reply(Locale locale, ReplyDTO vo,  @RequestParam("bno") int bno,@RequestParam("rno") int rno) throws Exception {
		logger.info("Success Delete reply", locale);
		rs.delete_reply(vo.getRno());
		System.out.println(vo);
		return "redirect:/read?bno="+bno;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(PageMaker pm,Model model) throws Exception {
		logger.info("listPage");
		System.out.println(pm);
		//PageMaker [page=2, perPageNum=10, searchType=t, keyword=888, totalCount=0, startPage=0, endPage=0, prev=false, next=false]
		System.out.println("리스트" + bm.listSearchCriteria(pm));
		System.out.println("비엠" + bm.listSearchCount(pm));
		model.addAttribute("list",bm.listSearchCriteria(pm));
		pm.setTotalCount(bm.listSearchCount(pm));
		
		return "redirect:/success";
	//	model.addAttribute("pageMaker",pm);
		//return "/list";
	}
	
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public void success(PageMaker pm,Model model,Authentication authentication) throws Exception {
		logger.info("listPage");
		System.out.println(pm);
		//PageMaker [page=2, perPageNum=10, searchType=t, keyword=888, totalCount=0, startPage=0, endPage=0, prev=false, next=false]
		System.out.println("리스트" + bm.listSearchCriteria(pm));
		System.out.println("비엠" + bm.listSearchCount(pm));
		model.addAttribute("list",bm.listSearchCriteria(pm));
		pm.setTotalCount(bm.listSearchCount(pm));
	      String re = "";
	      String tab = "&emsp;";
	      for(int i=0; i<bm.listSearchCriteria(pm).size();i++) {
	         if(bm.listSearchCriteria(pm).get(i).getDepth()!=0) {
	            for(int j=0;j<bm.listSearchCriteria(pm).get(i).getDepth();j++) {
	               re+=tab;
	            }
	            re += "└RE:";
	         }
	      }
	      model.addAttribute("re",re);
		UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken)authentication;
		String id = token.getName();
		System.out.println(id);
		model.addAttribute("id",id);
	
		
	//	model.addAttribute("pageMaker",pm);
		//return "/list";
	}
	
	
	@RequestMapping(value = "/testuploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> testuploadAjax(MultipartFile file) throws Exception {
		System.out.println("uploadAjax");
		System.out.println("originalName: " + file.getOriginalFilename());

		String savedName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
		// SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_");
		SimpleDateFormat formatter = new SimpleDateFormat("YYYYMM");
		Calendar now = Calendar.getInstance();

		String yearPath = formatter.format(now.getTime());
		String savedPath =  "C:\\SPFile";

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
	//	String uploadedFileName = null;                     
		System.out.println(savedName);
		us.addFile(savedName);
		return new ResponseEntity<>(savedName, HttpStatus.CREATED);
	}
	
	
	
//	@RequestMapping(value = "/upload", method = RequestMethod.GET, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
//	public String upload(@RequestParam("filename") MultipartFile file, Locale locale) throws Exception {
//		logger.info("Success Upload", locale);
//		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
//		long size = file.getSize(); //파일 사이즈
//		
//		System.out.println("파일명 : "  + fileRealName);
//		System.out.println("용량크기(byte) : " + size);
//		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
//		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
//		String uploadFolder = "C:\\SPFile";
//		
//		
//		/*
//		  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
//		  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
//		  타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
//		  고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
//		 */
//		
//		UUID uuid = UUID.randomUUID();
//		System.out.println(uuid.toString());
//		String[] uuids = uuid.toString().split("-");
//		
//		String uniqueName = uuids[0];
//		System.out.println("생성된 고유문자열" + uniqueName);
//		System.out.println("확장자명" + fileExtension);
//		
//	//	us.addFile(file);
//		
//		
//		
//		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
//		
//		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
//		try {
//			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return "redirect:/success";
//	}


}
