package iiiNews.AD.controller;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import iiiNews.AD.model.AdBean;
import iiiNews.AD.service.AdMainService;

@Controller
@SessionAttributes({"shoppingCart"})
public class AdMainController {
	
	@Autowired
	AdMainService service;
	
	/*在此controller內的功能有
	 * 取得上傳表格、送出使用者填好的上傳表格
	 * 取得所有廣告列表
	 * 根據該新聞的pk鍵 刪除該則廣告(單則)*/
	
	
	
	
	//取得上傳表格
	@GetMapping("/uploadAds")
	public String goUploadForm(Model model) {
		/*是Get方法時進來這裡 為的是傳表格給使用者
		*使用了表單綁定的方法 SpringMVC課本262頁 有三個地方名字要一樣 取叫adBean
		*new AdBean 跟 model.addAttribute也是這件事
		*最後回傳上傳的網頁的網址*/
		
		AdBean bean = new AdBean();
		
		//純粹是為了給初始值 可以不寫
//		bean.setAdNo("AD20201024");
//		bean.setWidth(600.0);
//		bean.setHeight(200.0);
//		bean.setPrice(1000);
//		bean.setStock(10);
		
		model.addAttribute("adBean",bean);
		return "AD/uploadAds";
	}
	
	//送出使用者填好的上傳表格
	@PostMapping("/uploadAds")
	public String uploadAdsForm(
			@ModelAttribute("adBean") AdBean bean, Model model) {
		/*是Post方法 使用者送出表格時進來這裡
		 * 讀取使用者資料跟型態轉換 這裡是透過@ModelAttribute("adBean") AdBean bean
		 * 就會傳完整的資料放在bean裡面傳進來給我們用
		 * 再填一些不是使用者輸入的資料 然後進行驗證資料 */
		
		Map<String, String> msg = new HashMap<>();
		
		//$$$$ 取得會員編號>>會員編號先寫死 未來再改
//		MBBean mb = (MBBean) model.getAttribute("Login_PK");
//		String memberId = mb.getMemberId();
		bean.setMemberId("tina");
		
		//取得上傳時間
		Timestamp uploadDate = new Timestamp(System.currentTimeMillis());
		bean.setUploadDate(uploadDate);
		
//		/*處理廣告編號問題
//		 * 編號命名方式 AD+日期+編號 AD2020102500001
//		 * 取得最後一筆編號資料進行判斷*/
		String noStr = service.createAdNo();
		bean.setAdNo(noStr);
		
		//預先設定上架狀態 1為上架
		bean.setStatus(1);
		
		int n = service.saveAds(bean);
		System.out.println("成功筆數："+n);
		
		//####優化 這裡要處理好傳送到前端的資訊的問題 要再想一下
		msg.put("addStatus", "上架廣告成功，已新增： "+n+" 筆");
		model.addAttribute("processMsg", msg);
		System.out.println(msg);
		return "redirect:/getAllAds";
	}
	
	
	//取得所有廣告列表
	@GetMapping("/getAllAds")
	public String getAllAdsList(Model model){
		List<AdBean> list = service.getAllAds();
		model.addAttribute("adLists",list);
		return "AD/adlist/allAdsList";
	}
	
	//$$$$ 根據企業會員資料(編號)取得該會員所有廣告列表
	@GetMapping("/memberAllAdsList")
	public String getMemberAdList(@PathVariable String cpmemberId,Model model){
//		List<AdBean> list = service.getAllAds();
//		model.addAttribute("adLists",list);
		return "AD/memberAllAdsList";
	}

	
	
	//根據該新聞的pk鍵 刪除該則廣告(單則)
	//####優化：要跳轉回去時告訴使用者刪掉幾筆
	@GetMapping("/deleteAdProduct/{adPk}")
	public String deleteAdProductById(@PathVariable Integer adPk,Model model) {
		int n = service.deleteAdByMemberPkid(adPk);
		System.out.println("成功更動 "+n+" 筆");
		return "redirect:/memberAllAdsList";
	}
	
	

	
	
	
}
