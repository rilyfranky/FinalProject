package balgil.com.trip.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import balgil.com.trip.users.model.UsersVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle()....");
		
		String sPath = request.getServletPath();
		log.info("preHandle()....{}",sPath);
		
		UsersVO user = (UsersVO) session.getAttribute("user");
		log.info("preHandle()....user : {}", user);
		
		//인터셉터 처리할 부분들 다 넣기
		if(sPath.equals("/selectAllCart.do")
				|| sPath.equals("/insertOneCart.do")
				|| sPath.equals("/updateOneCart.do")
				|| sPath.equals("/insertOneReservation.do")
				|| sPath.equals("/cancelReservation.do")
				|| sPath.equals("/selectAllReservation.do")
				|| sPath.equals("/selectCancelReservation.do")
				|| sPath.equals("/selectExpiredReservation.do")
				|| sPath.equals("/selectOneReservation.do")
				|| sPath.equals("/selectOneCancelReservation.do")
				|| sPath.equals("/selectOneExpiredReservation.do")
				|| sPath.equals("/deleteOneCancelReservation.do")
				|| sPath.equals("/selectAllUserCoupon.do") 
				|| sPath.equals("/userCoupon_insertOK.do") 
				|| sPath.equals("/myPage.do") 
//				|| sPath.equals("/myInfo.do") 
				|| sPath.equals("/selectMyComments.do") 
				|| sPath.equals("/selectMyWrittenComments.do") 
				|| sPath.equals("/selectMyOneComments.do") 
				|| sPath.equals("/insertComments.do") 
				|| sPath.equals("/insertCommentsOK.do") 
				|| sPath.equals("/updateComments.do") 
				|| sPath.equals("/updateCommentsOK.do") 
				|| sPath.equals("/deleteCommentsOK.do") 
				|| sPath.equals("/selectAllContactUser.do") 
				|| sPath.equals("/insertContact.do") 
				|| sPath.equals("/insertContactOK.do") 
				|| sPath.equals("/insertWishListOK.do") 
				|| sPath.equals("/selectAllWishList.do") 
				|| sPath.equals("/deleteOK.do") 
				|| sPath.equals("/addWish.do")) {
			
				if(user.getType() == 0 || user.getType() == 1 || user.getType() == 2 ) {
					response.sendRedirect("balgil.com");
					return false;
				}
		}else if(sPath.equals("/admin.do")
				|| sPath.equals("/selectAllCoupon.do")
				|| sPath.equals("/coupon_insertOK.do")
				|| sPath.equals("/selectAllSeller.do")
				|| sPath.equals("/selectAllUser.do")
				|| sPath.equals("/searchSellerList.do")
				|| sPath.equals("/searchUserList.do")
				|| sPath.equals("/selectOneSeller.do")
				|| sPath.equals("/selectOneUser.do")
				|| sPath.equals("/sellerTypeUpdate.do")
				|| sPath.equals("/insertFaqOK.do")
				|| sPath.equals("/updateFaqOK.do")
				|| sPath.equals("/deleteFaqOK.do") 
				|| sPath.equals("/deleteContactOK.do") 
				|| sPath.equals("/insertFaqOK.do")) {
			
			if(user.getType() == 1 || user.getType() == 2 ) {
				response.sendRedirect("balgil.com");
				return false;
			}
					
		}else if(sPath.equals("/insertAct.do")
				|| sPath.equals("/insertActOk.do")
				|| sPath.equals("/updateAct.do")
				|| sPath.equals("/updateActOk.do")
				|| sPath.equals("/deleteActOk.do")
				|| sPath.equals("/selectAllAct.do")
				|| sPath.equals("/selectOneAct.do")
				|| sPath.equals("/jsonSelectAllAct.do")
				|| sPath.equals("/insertRoute.do")
				|| sPath.equals("/insertRouteOk.do")
				|| sPath.equals("/updateRoute.do")
				|| sPath.equals("/updateRouteOk.do")
				|| sPath.equals("/deleteRouteOk.do") 
				|| sPath.equals("/selectAllRoute.do") 
				|| sPath.equals("/selectOneRoute.do") 
				|| sPath.equals("/deleteAnswerOK.do") 
				|| sPath.equals("/insertAnswerOK.do") 
				|| sPath.equals("/updateAnswerOK.do")) {
			
			if(user.getType() == 2 || user.getType() == 3 ) {
				response.sendRedirect("balgil.com");
				return false;
			}
			
		}else if(sPath.equals("/selectAllContact.do") 
				|| sPath.equals("/selectOneContact.do")) {
			
			if(user.getType() == 2 ) {
				response.sendRedirect("balgil.com");
				return false;
			}
			
		}else if(sPath.equals("/seller.do")) {
			
			if(user.getType() == 3 ) {
				response.sendRedirect("balgil.com");
				return false;
			}
			
		} return true;
		
	}
	
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		log.info("postHandle()....");
//	}
	
}
