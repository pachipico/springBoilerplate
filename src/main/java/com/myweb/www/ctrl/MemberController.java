package com.myweb.www.ctrl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.service.MemberService;

@RequestMapping("/member/*")
@Controller("/member")
public class MemberController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService msv;

	@GetMapping("/login")
	public void login() {
		logger.debug(">>> /member/login - GET ");
	}

	@PostMapping("/login")
	public String login(MemberVO mvo, HttpSession ses, RedirectAttributes reAttr) {
		logger.debug(">>> mvo: {}", mvo);
		MemberVO loginMvo = msv.login(mvo);
		if (loginMvo != null) {
			ses.setAttribute("ses", loginMvo);
			ses.setMaxInactiveInterval(10 * 60);
		}
		reAttr.addFlashAttribute("isLogin", ses.getAttribute("ses") != null ? 1 : 0);

		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logOut(HttpSession ses, RedirectAttributes reAttr) {
		ses.removeAttribute("ses");
		reAttr.addFlashAttribute("isLogout", ses.getAttribute("ses") == null ? 1 : 0);
		ses.invalidate();

		return "redirect:/";
	}

	@GetMapping("/detail")
	public void detail(@RequestParam("email") String email, Model model) {
		logger.debug(">>> member detail email: {}", email);
		MemberVO mvo = msv.getDetail(email);
		model.addAttribute("mvo", mvo);
		logger.debug(">>> {}", mvo);
	}

	@GetMapping
	public String remove(@RequestParam("email") String email, HttpSession ses, RedirectAttributes reAttr) {
		ses.removeAttribute("ses");
		int isDel = msv.remove(email);
		reAttr.addFlashAttribute("isDel", isDel);
		return "redirect:/";
	}

	@PostMapping("/modify")
	public String modify(MemberVO mvo, RedirectAttributes reAttr) {
		int isUp = msv.modify(mvo);
		reAttr.addFlashAttribute("isUp", isUp);
		return "redirect:/member/detail?email=" + mvo.getEmail();
	}

	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", msv.getList());

	}

//	@RequestMapping(value = "/register", method = RequestMethod.GET)
	@GetMapping("/register")
	public void register() {
		logger.debug(">>> /member/register - GET ");
	}

//	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@PostMapping("/register")
	public String register(MemberVO mvo, RedirectAttributes reAttr) {
		logger.debug(">>> /member/register - POST");
		logger.debug(">>> mvo: {}", mvo);
		int isUp = msv.register(mvo);
		logger.debug(">>> member register {}", isUp > 0 ? "success" : "failed");

		reAttr.addFlashAttribute("isUp", isUp);
		return "redirect:/";
	}

	@ResponseBody
	@PostMapping(value = "/dupleCheck", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> dupleCheck(@RequestBody HashedMap<String, String> map) {
		String email = map.get("email");
		int isExist = msv.dupleCheck(email);
		return isExist > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) : new ResponseEntity<String>("0", HttpStatus.OK);
	}

	@ResponseBody
	@PostMapping(value = "/modGrade", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateGrade (@RequestBody MemberVO mvo){

		int isUp = msv.updateGrade(mvo);
		logger.debug("isUpdated ? {}", isUp);
		return isUp > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) : new ResponseEntity<String>("0", HttpStatus.OK);
	}
	
}
