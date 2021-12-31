package com.myweb.www.ctrl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.ProductVO;
import com.myweb.www.service.ProductService;


@RequestMapping("/product/*")
@Controller("/product")
public class ProductController {
	private static Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	ProductService psv;
	
	@GetMapping
	public void list(Model model) {
		model.addAttribute("list", psv.getList());
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(ProductVO pvo, RedirectAttributes reAttr) {
		logger.debug("pvo: {}",pvo);
		int isUp = psv.register(pvo);
		reAttr.addFlashAttribute("isUp", isUp);
		return "redirect:/product/list";
	}
	
	@PostMapping("/modify")
	public String modify(ProductVO pvo, RedirectAttributes reAttr) {
		reAttr.addFlashAttribute("isUp", psv.modify(pvo));
		return "redirect:/product/detail?pno=" + pvo.getPno();
	}
	
	@GetMapping("detail")
	public void detail(@RequestParam("pno") Long pno, Model model) {
		model.addAttribute("pvo", psv.getDetail(pno));
	}
	
	@PostMapping("remove")
	public String remove(@RequestParam("pno") Long pno, RedirectAttributes reAttr) {
		int isDel = psv.remove(pno);
		reAttr.addFlashAttribute("isDel", isDel);
		logger.debug("remove : {}", isDel);
		return "redirect:/product/list";
	}
	
	
	
}
