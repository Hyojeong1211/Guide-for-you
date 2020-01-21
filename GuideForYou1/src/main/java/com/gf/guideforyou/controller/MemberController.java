package com.gf.guideforyou.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gf.guideforyou.mapper.MemberSQLMapper;
import com.gf.guideforyou.service.*;
import com.gf.guideforyou.vo.*;
import org.springframework.ui.Model;



@Controller
public class MemberController {

	@Autowired
	JavaMailSender mailSender;

	@Autowired
	private MemberService memberService;

	@RequestMapping("/loginPage")
	public String loginPage() {
		return "loginPage";
	}

	@RequestMapping("/joinMemberPage")
	public String joinMemberPage() {
		return "joinMemberPage";
	}

	@RequestMapping("/joinMemberAction")
	public String joinMemberAction(MemberBasicVo param) {

		memberService.joinMember(param);

		return "loginPage";
	}

	@RequestMapping("/loginAction")
	public String loginAction(MemberBasicVo param, HttpSession session) {

		SessionUserDataVo memberSession = memberService.login(param);

		if (memberSession == null) {
			return "loginFailPage";
		}
		session.setAttribute("memberSession", memberSession);
		return "redirect:indexPage";
	}

	@RequestMapping("/logoutAction")
	public String logoutAction(HttpSession session) {
		session.invalidate();
		return "redirect:indexPage";
	}

	@RequestMapping("/withdrawPage")
	public String withdrawPage() {
		return "widthdrawPage";
	}

	@RequestMapping("/withdrawAction")
	public String withdrawAction(MemberBasicVo param, HttpSession session) {

		SessionUserDataVo sessionVo = (SessionUserDataVo) session.getAttribute("memberSession");
		param.setMember_idx(sessionVo.getMember_idx());
		memberService.withdraw(param);
		return "indexPage";

	}

	@RequestMapping("/checkPasswordPage")
	public String checkPasswordPage() {

		return "checkPasswordPage";
	}

	@RequestMapping("/editProfilePage")
	public String editProfilePage(HttpSession session, Model model) {

		System.out.println("Editing profile process start-->");

		// Bring member_idx from Session
		SessionUserDataVo editProfileSessionData = (SessionUserDataVo) session.getAttribute("memberSession");
		int editProfileMember_idx = editProfileSessionData.getMember_idx();

		System.out.println("member_idx=" + editProfileMember_idx);

		// Bring my information from member_idx
		MemberBasicVo membervo = new MemberBasicVo();
		membervo.setMember_idx(editProfileMember_idx);

		MemberBasicVo memberEditProfileInfo = memberService.readProfile(membervo);

		model.addAttribute("memberEditProfileInfo", memberEditProfileInfo);

		return "editProfilePage";
	}

	@RequestMapping("/editProfileAction")
	public String editProfileAction(MemberBasicVo param, MultipartFile[] files, HttpSession session) {

		System.out.println("File saving start-->");

		// File saving logic start....
		ArrayList<UploadFileVo> fileList = new ArrayList<UploadFileVo>();
		ArrayList<String> linkList = new ArrayList<String>();

		String uploadFilePath = "C:\\tomcat\\apache-tomcat-8.5.43\\wtpwebapps\\GuideForYou\\uploadFiles\\";

		for (MultipartFile file : files) {

			if (file.getSize() <= 0)
				continue;

			String originalFilename = file.getOriginalFilename();

			// Changing File name....(time,random)
			String randomName = UUID.randomUUID().toString();
			System.out.println(randomName);

			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));

			randomName += ext;

			File f = new File(uploadFilePath + randomName);

			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}

			String link = "./uploadFiles/" + randomName;

			UploadFileVo fileVo = new UploadFileVo(null, null, file.getOriginalFilename(), link);

			fileList.add(fileVo);
			linkList.add(link);

		}

		// pur profile picture link to Data base
		if (linkList.size() == 1) {
			param.setMember_profile_photo(linkList.get(0));
			System.out.println("profile page saving done");
		}

		
		memberService.editProfile(param);

		return "myPage";
	}

	@RequestMapping("/idReset")
	public String idReset() {

		return "idReset";

	}

	@RequestMapping("/passwordReset")
	public String passwordReset() {

		return "passwordReset";
	}

	@RequestMapping("/mailSendingPage")
	public String SendPassword(MemberBasicVo param) {
		
		System.out.println(param.getMember_email());
		
		//memberService.passwordMaker(param);

		try {
			MimeMessage message = null;
			MimeMessageHelper messageHelper = null;
				messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		message = mailSender.createMimeMessage();
			messageHelper.setSubject(""); // title
			messageHelper.setText("Your Guide for you temporary password is"+memberService.passwordMaker(param)+
					true);
			messageHelper.setFrom("admin", "Admin");
			messageHelper.setTo(param.getMember_email());
			
			// messageHelper.addInline(contentId, dataSource);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mailSendingPage";
	}

}
