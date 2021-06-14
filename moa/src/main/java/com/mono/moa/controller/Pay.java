package com.mono.moa.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.cglib.core.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.*;

import com.mono.moa.dao.*;
import com.mono.moa.vo.*;

@Controller
@RequestMapping("/pay")

public class Pay {
	private Pay api;
@Autowired
ExhibitDao eDao;
@Autowired
MemberDao mDao;
@Autowired
SubPageDao sbDao;
@Autowired
PayDao pDao;
	
	//결제페이지----------------------------------------------
		//결제페이지 폼보기
		@RequestMapping("/paypage.moa")
		public ModelAndView payPage(ModelAndView mv, HttpSession session, RedirectView rv, EventVO eVO, PayVO payVO) {
			//System.out.println("######## eVO.exino : " + eVO.getExino()); 
			String sid = (String)session.getAttribute("SID");
			if(sid ==null) {
				rv.setUrl("/moa/member/login.moa");
				mv.setView(rv);
				return mv;
			}
			EventVO data = eDao.getExhDetail(eVO.getExino());
			MemberVO memb = mDao.getMyInfo(sid);
			
			mv.addObject("MEMB", memb);
			mv.addObject("DATA", data);
			
			mv.setViewName("/pay/paypage");
			return mv;
		}
	
		
		
/*
@RequestMapping(value="/paypage.moa", method=RequestMethod.POST)
       public ModelAndView payPage(ModelAndView mv, HttpSession session, RedirectView rv, EventVO eVO, PayVO payVO) {
          String sid = (String)session.getAttribute("SID");
          if(sid ==null) {
             rv.setUrl("/moa/member/login.moa");
             mv.setView(rv);
             return mv;
          }
          EventVO data = eDao.getExhDetail(eVO.getExino());
          MemberVO memb = mDao.getMyInfo(sid);
          
          mv.addObject("MEMB", memb);
          mv.addObject("DATA", data);
          
          mv.setViewName("/pay/paypage");
          return mv;
       }
*/
 
	

	/*		
		//결제 성공
		public Pay() {
			this.api = new Pay("0212558148262524","phaaeLmg2wyD5oLxgZdvyuUgEhhU1fIqxSAMDX3GtBjz057g4lLCQGTuXboZq7pYZ0KDYNjspD2pI9FN");
			
		}
		
	@RequestMapping("/paySuccess.moa")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(Model model, Local locale, HttpSession session, @PathVariable(value="imp_uid" String imp_uid) throws ImaportResponseException, IOException{
		return api.paymentByImpUid(imp_uid);
	 
		
		
}
*/
/*
public ModelAndView paySuccess(ModelAndView mv, HttpSession session, RedirectView rv, PayVO payVO) {
    String sid = (String)session.getAttribute("SID");
MemberVO memb = mv.getAttribute("MEMB");
EventVO data = mv.getAttribute("DATA");
    if(sid ==null) {
       rv.setUrl("/moa/member/login.moa");
       mv.setView(rv);
       return mv;
    }
    System.out.println("payVO--"+ payVO);
    int addInfo = pDao.addpayinfo(payVO);
    System.out.println("addinfo1111" + addInfo);
    if(addInfo == 1) {
       mv.setViewName("main");
    }
    return mv;
 }
 */
/*
			@RequestMapping(value="/paySuccess.moa", method=RequestMethod.POST)
			@ResponseBody
			 public HashMap<String, Object> paySuccess(ModelAndView mv, HttpSession session, RedirectView rv, PayVO payVO) {
	           HashMap<String, Object> map = new HashMap<String, Object>();
			   String sid = (String)session.getAttribute("SID");
			            
			            System.out.println("payVO--"+ payVO);
			            int addInfo = pDao.addpayinfo(payVO);
			            System.out.println("addinfo1111" + addInfo);
			            if(addInfo == 1) {
			               map.put("everythings_fine", "OK");;
			            }
			            return map;
			         }
*/			
			
		
			
	/*		
		//결제취소 폼보기!!
			@RequestMapping("/payFail.moa")
			public ModelAndView payFail(ModelAndView mv, HttpSession session, RedirectView rv, EventVO eVO) {
				String sid = (String)session.getAttribute("SID");
				
				mv.setViewName("pay/payFail");
				return mv;
			}
			
	*/		
}
