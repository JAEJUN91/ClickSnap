package org.np.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.np.domain.ArtistVO;
import org.np.domain.AttachFileDTO;
import org.np.domain.ServiceVO;
import org.np.mapper.ArtistMapper;
import org.np.service.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/artPage/*")
public class ArtistController {
	
	@Setter(onMethod_ = {@Autowired})
	private ServiceService service;
	
	@Setter(onMethod_ = {@Autowired})
	private ArtistMapper aMapper;
	
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachFileDTO>> uploadFormPost(MultipartFile[] uploadFiles) {
		
		String uploadFolder = "c:/imgs";
		List<AttachFileDTO> list = new ArrayList<>();
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("업로드 경로 : "+uploadPath);
		
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		log.info(uploadFiles.length);
		
		for(MultipartFile mf : uploadFiles) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			log.info("멀티파트 파일을 처리 시작");
			log.info("fileName : "+mf.getOriginalFilename());
			log.info("fileSize : "+mf.getSize());
			
			UUID uuid = UUID.randomUUID();
			String uploadFileName = mf.getOriginalFilename();
			attachDTO.setFileName(uploadFileName);
			uploadFileName = uuid.toString()+"_"+mf.getOriginalFilename();
			File saveFile = new File(uploadPath,uploadFileName);
			
			try {
				mf.transferTo(saveFile);
				attachDTO.setUuid(uuid.toString());
				BufferedImage bi = ImageIO.read(saveFile);
				attachDTO.setUploadPath(getFolder());
				FileOutputStream thumbnail = 
				new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
				Thumbnailator.createThumbnail(mf.getInputStream(), thumbnail,
						(int)(bi.getWidth()*0.4),(int)(bi.getHeight()*0.4));
				thumbnail.close();
				list.add(attachDTO); log.info("attachDTO : "+attachDTO);
			}catch (Exception e) {
				log.error(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("파일명 : "+ fileName);
		File file = new File("c:/imgs/"+fileName);
		ResponseEntity<byte[]> result = null;
		try {
			log.info("이미지 보여주러 들어갑니다.");
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
					header, HttpStatus.OK);	
		}catch (Exception e) {e.printStackTrace();}
		return result;
	}

	@PostMapping("/register")
	public ResponseEntity<String> register(ServiceVO vo, RedirectAttributes rttr) {
		log.info("register : "+ vo);
		for(int i=0; i<vo.getTList().length; i++) {
			log.info(vo.getTList()[i]);
		}
		vo.getIList().forEach(imgs -> log.info("images : "+imgs));
		service.insert(vo);
		rttr.addFlashAttribute("result", vo.getSno());
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	public String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		//str = 2021-06-06
		return str.replace("-", File.separator);
	}
	

	// 상품 등록하는 부분
	@GetMapping("/register")
	public void register() {
		log.info("상품 등록하러!");
	}
	
	/*@PostMapping("/register") // post방식 게시글 저장
	public String register(NpProductVO npvo, RedirectAttributes rttr) {
		log.info("register :" + npvo);
		if(npvo.getImageList()!=null) {
			npvo.getImageList().forEach(attach-> log.info(attach));		
		}
		log.info("================================");
		npservice.register(npvo);
		rttr.addFlashAttribute("result" , npvo.getSno());
		return "redirect:/artPage/list";  // redirect를 하지 않는 경우는, 새로고침시 도배가 된다.
	}*/
	
	@GetMapping("/map")
	public void test() {
		log.info("123123");
	}
	// \. 상품 등록하는 부분 끝
	
	@GetMapping("/artistList")
	public void artistList(String artistId, Model model) {
		log.info("artistList매핑");
		ArtistVO vo = aMapper.read(artistId);
		model.addAttribute("artist", vo);
	}
	
	@GetMapping("/serviceList")
	public void serviceList() {
		log.info("serviceList로 매핑");
	}
	
	
}
