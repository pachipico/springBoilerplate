package com.myweb.www.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.myweb.www.domain.CommentVO;
import com.myweb.www.service.CommentService;

@Controller("/comment")
@RequestMapping("/comment/*")
public class CommentController {
	private static Logger logger = LoggerFactory.getLogger(CommentController.class);

	@Inject
	private CommentService csv;

	@PostMapping(value = "/post", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> post(@RequestBody CommentVO cvo) {
		int isUp = csv.register(cvo);

		return isUp > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

// list를 jsp에게 줄 것인지 자바스크립트로 받을수 있게 할 것인
//	@GetMapping
//	public ResponseEntity<String> list(@RequestParam("pno") Long pno) {
//		List<CommentVO> list = csv.getList(pno);
//		Gson gson = new Gson();
//		String json = gson.toJson(list);
//		return new ResponseEntity<String>(json, HttpStatus.OK);
//	}
	@GetMapping(value = "/{pno}", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<CommentVO>> spread(@PathVariable("pno") Long pno){
		
		return new ResponseEntity<List<CommentVO>>(csv.getList(pno), HttpStatus.OK);
	}

//	@PostMapping(value = "/delete", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
//	public ResponseEntity<String> delete(@RequestBody HashedMap<String, String> map) {
//		int isUp = csv.remove(Long.parseLong(map.get("cno")));
//		
//		return new ResponseEntity<String>(isUp > 0 ? "1" : "0", HttpStatus.OK);
//
//	}
	@DeleteMapping(value = "/{cno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete(@PathVariable("cno") Long cno) {
		return csv.remove(cno) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

//	@PostMapping
//	public ResponseEntity<String> modify(@RequestBody CommentVO cvo) {
//		int isUp = csv.modify(cvo);
//		return new ResponseEntity<String>(isUp > 0 ? "1" : "0", HttpStatus.OK);
//	}
	@PutMapping(value = "/{cno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify (@PathVariable("cno") Long cno, @RequestBody CommentVO cvo){
		return csv.modify(cvo) > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
