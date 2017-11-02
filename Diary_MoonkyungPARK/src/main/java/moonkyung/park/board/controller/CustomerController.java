package moonkyung.park.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import moonkyung.park.board.dao.CustomerDAO;
import moonkyung.park.board.repository.CustomerRepository;
import moonkyung.park.board.repository.FriendRepository;
import moonkyung.park.board.repository.MessageRepository;
import moonkyung.park.board.vo.Customer;

@RequestMapping(value = "/customer")
@Controller
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Inject
	CustomerRepository cRepository;

	@Inject
	FriendRepository fRepository;
	
	@Inject
	MessageRepository mRepository;

	@Inject
	HttpSession session;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("회원가입");
		return "customer/join";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "customer/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, Customer customer) {
		Customer cusCompare = cRepository.selectCustomer(customer.getCus_id());
		if (cusCompare == null) {
			model.addAttribute("loginResult", "없는 아이디입니다. 회원 가입 후 이용해주세요.");
			return "home";
		}
		if (cusCompare.getCus_pw().equals(customer.getCus_pw())) {
			logger.info("로그인 성공");
			model.addAttribute("loginResult", "로그인에 성공하였습니다.");
			session.setAttribute("loginid", cusCompare.getCus_id());
			session.setAttribute("loginNickname", cusCompare.getCus_nickname());
			//새 메세지, 친구 요청 수 세기 위한 세션
			int numofFriendRequest=fRepository.numofFriendRequest(customer.getCus_id());
			session.setAttribute("numofFriendRequest", numofFriendRequest);
			int numofReadMessage=mRepository.numofMessage(customer.getCus_id(), "read");
			session.setAttribute("numofReadMessage", numofReadMessage);
			int numofSentMessage=mRepository.numofMessage(customer.getCus_id(), "sent");
			session.setAttribute("numofSentMessage", numofSentMessage);
			return "home";
		} else {
			logger.info("로그인 실패");
			model.addAttribute("loginResult", "로그인에 실패하였습니다.");
			return "customer/login";
		}
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model model, Customer customer) {
		int result = cRepository.insertCustomer(customer);
		int fResult = fRepository.addInformation(customer);
		logger.info("회원 가입하기 결과: " + customer + " ," + result + " , " + fResult);
		return "home";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		session.invalidate();
		logger.info("로그아웃");
		model.addAttribute("loginResult", "로그아웃 되었습니다.");
		return "home";
	}

	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String check() {
		logger.info("아이디 체크 창 열기");
		return "customer/check";
	}

	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public @ResponseBody String check(String checkid) {
		Customer customer = cRepository.selectCustomer(checkid);
		logger.info("아이디 체크: " + checkid);
		if (customer == null) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping(value = "/findPassword", method = RequestMethod.GET)
	public String findPassword() {
		return "customer/findPassword";
	}

	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public @ResponseBody String findPassword(Customer customer) {
		String password = cRepository.findPassword(customer);
		if (password == null) {
			return "false";
		} else {
			return password;
		}
	}
}
