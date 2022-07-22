# 상품판매 페이지
- 1. 결제 및 상품 구매 처리
- 2. 구매상품 파일 다운로드   

***

## 1. 결제 및 상품 구매 처리
- iamport api 이용 kg이니스 결제
- 장바구니에 담긴 상품을 결제 완료 후 List에 담아 구매상품 목록에 insert

```javascript
<script type="text/javascript">
	$(function(){
		$('#checkOut').click(function(){
	         if(!$('#bank').is(':checked')){
	            alert('결제 방식을 체크해주세요.');
	            $('#bank').focus();
	            event.preventDefault();
	         }else if(!$('#agree').is(':checked')){
	        	 alert('환불이 불가능한 상품입니다. 동의하셔야 결제 가능합니다.');
	        	 event.preventDefault();
	         }else{
	        	 var IMP = window.IMP; // 생략가능
	     		IMP.init('식별코드'); 

	     		IMP.request_pay({
	     			pg: 'kakao',
	     			pay_method: 'card',
	     			merchant_uid: 'merchant_' + new Date().getTime(),
	     			
	     			name:'${pdName} 외 ${count}건',
	     			// 결제창에서 보여질 이름

	     			amount: ${sum},
	     			// 가격 
            
	     			buyer_name: '${sessionScope.memName}',
	     			// 구매자 이름
            
	     			buyer_postcode: '123-456',
	     			}, function (rsp) {
	     				console.log(rsp);
	     			if (rsp.success) {
	     				var msg = '결제가 완료되었습니다. ';
	     				msg += '결제 금액은 ' + rsp.paid_amount+'원 입니다.';
	     				$('#form-cart-pay input[name=payPrice]').val(${sum});
	     				$('#form-cart-pay').submit();
	     				// success.submit();
	     				// 결제 성공 시 form에 정보를 담아 submit

	     			} else {
	     				var msg = '결제에 실패하였습니다.';
	     				msg += '에러내용 : ' + rsp.error_msg;
	     			}
	     			alert(msg);
	     		});
	         }
	      });
	});
</script>
```

- 컨트롤러에서 장바구니 정보와 결제 정보를 받아 구매목록 insert   

```java
package com.metaus.pay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.metaus.buy.model.BuyService;
import com.metaus.buy.model.BuyVO;
import com.metaus.cart.model.CartService;
import com.metaus.cart.model.CartVO;
import com.metaus.pay.model.PayService;
import com.metaus.pay.model.PayVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/pay")
@RequiredArgsConstructor
public class PayController {
	private static final Logger logger
	=LoggerFactory.getLogger(PayController.class);
	
	private final PayService payService;
	private final CartService cartService;
	private final BuyService buyService;
	
	@RequestMapping("/pay")
	public String pay(@RequestParam int pdNo, @RequestParam int payPrice,@RequestParam String payKind, HttpSession session, @ModelAttribute PayVO payVo) {
		int memNo=(int)session.getAttribute("memNo");
		logger.info("결제 완료 페이지 파라미터 payVo={},memNo={},pdNo={}",payVo,memNo, pdNo);
		payVo.setMemNo(memNo);
		payVo.setPayPrice(payPrice);
		payVo.setPayKind(payKind);
		int cnt=payService.insertPay(payVo);		
		logger.info("결제 완료 파라미터 cnt={}",cnt);
		
		List<CartVO> list=cartService.selectCartList(memNo);
		BuyVO buyVo= new BuyVO();
		if(cnt>0) {
			for(int i=0;i<list.size();i++) {
				CartVO cartVo=list.get(i);
				buyVo.setMemNo(memNo);
				buyVo.setPdNo(cartVo.getPdNo());
				int res=buyService.insertBuy(buyVo);
			}
			logger.info("결제 완료 파라미터 buyVo={}, list.size={}",buyVo,list.size());		
			cnt=cartService.deleteCartAllByMemNo(memNo);
		}
					
		return "redirect:/pd/myPdList";
	}
}

```   

***

## 2. 구매상품 다운로드 처리
```javascript
<td class="cart-product-subtotal">
       <a href="<c:url value='/product/${vo.pdFilename }'/>" class="btn btn-purple btn-effect" id="download">다운로드</a>
</td>
```
