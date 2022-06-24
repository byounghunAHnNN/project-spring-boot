package com.example.web.Controller.api;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.web.config.auth.PrincipalDetail;
import com.example.web.dto.ResponseDto;
import com.example.web.model.Board;
import com.example.web.model.Reply;
import com.example.web.service.BoardService;
import com.google.gson.JsonObject;

@RestController
public class boardApiController {


	@Autowired
	private BoardService boardSerivce;

	@PostMapping("/api/boardWrite")
	public ResponseDto<Integer> save(@RequestBody Board board, @AuthenticationPrincipal PrincipalDetail principal) { // username, password, email
		
		// 디코딩 영역 //
		
		boardSerivce.글쓰기(board, principal.getUser());
		return new ResponseDto<>(HttpStatus.OK.value(), 1); //console(resp) 해보면 resp에 200, data에 1 return 되는걸 확인

	}

	@DeleteMapping("/api/board/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id,  @AuthenticationPrincipal PrincipalDetail principal){
		boardSerivce.글삭제하기(id,principal);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PutMapping("/api/board/{id}")
	public ResponseDto<Integer> modify(@PathVariable int id, @RequestBody Board board){
		System.out.println("board update:"+ id);
		System.out.println("board update:"+ board.getTitle());
		System.out.println("board update:"+ board.getContent());
		boardSerivce.글수정하기(id,board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	//데이터 받을 때 컨트롤러에서 DTO를 만들어서 받는게 좋다.
	//DTO를 사용하지 않은 이유?-> 작은 프로젝트라 ? 거대해지면 ?? 관리할 데이터들을 나눠서 수정을 촘촘히 가능하게?
	@PostMapping("/api/board/{boardId}/reply")
	public ResponseDto<Integer> replySave(@PathVariable int boardId, @RequestBody Reply reply, @AuthenticationPrincipal PrincipalDetail principal) { // username, password, email
		
		reply.setUser(principal.getUser());	
		boardSerivce.댓글쓰기(principal.getUser(), boardId, reply);
		return new ResponseDto<>(HttpStatus.OK.value(), 1); //console(resp) 해보면 resp에 200, data에 1 return 되는걸 확인
	}
	
	@DeleteMapping("/api/board/{boardId}/reply/{replyId}")
	public ResponseDto<Integer> replyDelete(@PathVariable int replyId, @AuthenticationPrincipal PrincipalDetail principal){
		boardSerivce.댓글삭제(replyId,principal);
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
		
	}
	
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
}
