# 회원관리, 게시판 관리
  - 1. 일반회원 차단기능
  - 2. 기업회원 조회
  - 3. 메세지 전체 발송
  - 4. 신고 게시글 관리
  - 5. 상품관리 다중조건 검색 

***

## 1. 일반회원 차단 기능   

![일반회원](https://user-images.githubusercontent.com/99188096/180408019-9833c1b2-c322-4e9e-a34f-aff244e46ce4.PNG)   
- 차단회원의 경우 초록색 버튼 노출, 클릭시 차단 해제
- 비차단 회원의 경우 빨간색 버튼 노출, 클릭 시 경고수(일) 만큼 차단   

```java
  @RequestMapping("/memberLock")
	public String memberLock(@ModelAttribute MemberVO vo) {
		logger.info("일반회원 차단 vo={}",vo);
		
    //현재 일자
		Date date = new Date();
    
    //회원의 경고수를 일수로 변환
		long cutTime = (long)(vo.getMemWarncnt()*24*60*60*1000);		
    
    //현재일자로부터 경고수(일) 경과된 시간 계산
		Timestamp timestamp = new Timestamp(date.getTime()+cutTime);
		
		//회원의 차단일 세팅
		vo.setMemCutdate(timestamp);
		
		int cnt = memberService.lockMember(vo);
		logger.info("일반회원 차단 cnt={}",cnt);
		
		return "redirect:/admin/member/memberList";
	}
	

```


-차단 회원 접속시도시 로그인 차단   


![ㅊㅊ](https://user-images.githubusercontent.com/99188096/180408588-575285c0-4b2e-4054-992b-193255ee3a75.PNG)   


```java
@RequestMapping("/memberlogin")
	public String memlogin_post(@ModelAttribute MemberVO vo,
			HttpServletRequest request,
			HttpServletResponse response, Model model, HttpSession session) {
		logger.info("로그인 처리, 파라미터 vo={}", vo);
		
		PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
		try {
			String password = VisitListener.decryptRsa(privateKey, vo.getMemPw());
			vo.setMemPw(password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.info("로그인 전 vo={}", vo);
		
		int result=memberService.checkLogin(vo.getMemId(), vo.getMemPw());
		logger.info("로그인 처리 결과 result={}", result);
		
		String msg="로그인 처리 실패", url="/";
		if(result==MemberService.LOGIN_OK) {
			//회원정보 조회
			MemberVO memVo=memberService.selectByUserid(vo.getMemId());
			logger.info("로그인 처리-회원정보 조회결과 memVo={}", memVo);
			
			if(memVo.getMemCutdate()!=null) {
				Timestamp cutdate = memVo.getMemCutdate();
				Date cutdate2 = new Date(cutdate.getTime());
				Date today = new Date();
				
				long gap = cutdate2.getTime()-today.getTime();
				System.out.println(gap);
				if(gap>0) {
					msg=cutdate+" 까지 이용이 차단된 계정입니다.";
					model.addAttribute("msg", msg);
					model.addAttribute("url", url);
					return "/common/message";
				}
				
			}
			
			//[1] session에 저장
			session.setAttribute("isLogin", "member");
			session.setAttribute("memNo", memVo.getMemNo());
			session.setAttribute("memId", vo.getMemId());
			session.setAttribute("memName", memVo.getMemName());
			
			msg=memVo.getMemName() +"님 로그인되었습니다.";
			url="/";
		}else if(result==MemberService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.NONE_USERID) {
			msg="해당 아이디가 존재하지 않습니다.";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
```

***

## 2. 기업회원 조회
- 회원가입 시 기업 주소를 위도경도로 자동변환
- 해당 위도경도를 이용 카카오 지도 api 위치 표시   

![기업정보](https://user-images.githubusercontent.com/99188096/180409334-cb213c49-204f-4fd1-a083-5440f8db1481.PNG)   


```javascript
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=앱키&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(${comVo.comLati}, ${comVo.comLongi}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    }; 
var map = new kakao.maps.Map(mapContainer, mapOption); 
var coords = new kakao.maps.LatLng(${comVo.comLati}, ${comVo.comLongi});
var marker = new kakao.maps.Marker({
    map: map,
    position: coords
});


</script>
```

***

## 3. 메세지 전체 발송   

![메세지](https://user-images.githubusercontent.com/99188096/180409882-dc6da526-8d54-4d28-9673-51f490841001.PNG)   

- 우측 체크박스 선택 범위에 따라 메세지 전체 발송   

```java
	@PostMapping("/sendAll")
	public String sendAll_post(@ModelAttribute MailboxVO vo, @RequestParam String[] mailScope, HttpSession session, Model model){
		
		String memId=(String) session.getAttribute("managerId");
		logger.info("memId={}", memId);
		vo.setMsgaddAdser(memId);
		
		logger.info("메세지 전송 처리, 파라미터 vo={}", vo);
		
		int cnt1=mailboxService.insertMailbox(vo);
		logger.info("메세지 송신자 등록 결과 cnt={}", cnt1);
		
		int cnt3=0;
		for(int i=0; i<mailScope.length;i++) {
			if(mailScope[i].equals("1")) {
				List<MemberVO> list = memberService.selectAll();
				
				for(int j=0; j<list.size(); j++) {
					MemberVO memberVo = list.get(j);
					RecipientVO recipientVo = new RecipientVO();
					recipientVo.setMsgaddAdsee(memberVo.getMemId());
					recipientVo.setTemporaryFlag("N");
					
					int msgNo=mailboxService.selectMsgNo();
					recipientVo.setMsgNo(msgNo);
					
					int cnt2=mailboxService.insertRecipient(recipientVo);
					if(cnt2>0) {
						cnt3++;
					}
				}
				
			}else if(mailScope[i].equals("2")) {
				List<CompanyVO> list = comService.selectAll();
				
				for(int j=0; j<list.size(); j++) {
					CompanyVO memberVo = list.get(j);
					RecipientVO recipientVo = new RecipientVO();
					recipientVo.setMsgaddAdsee(memberVo.getComId());
					recipientVo.setTemporaryFlag("N");
					
					int msgNo=mailboxService.selectMsgNo();
					recipientVo.setMsgNo(msgNo);
					
					int cnt2=mailboxService.insertRecipient(recipientVo);
					if(cnt2>0) {
						cnt3++;
					}
				}
				
			}else if(mailScope[i].equals("3")) {
				List<ManagerVO> list = managerService.selectAll();
				
				for(int j=0; j<list.size(); j++) {
					ManagerVO memberVo = list.get(j);
					RecipientVO recipientVo = new RecipientVO();
					recipientVo.setMsgaddAdsee(memberVo.getManagerId());
					recipientVo.setTemporaryFlag("N");
					
					int msgNo=mailboxService.selectMsgNo();
					recipientVo.setMsgNo(msgNo);
					
					int cnt2=mailboxService.insertRecipient(recipientVo);
					if(cnt2>0) {
						cnt3++;
					}
				}
				
			}
			
		}
		logger.info("전체발송 결과 발숭 메세지 수 cnt3={}",cnt3);
		String msg="메세지 발송 실패", url="/admin/mail/sendAll";
		if(cnt3>0) {
			msg="메세지 발송 성공, 발송 메세지 수 = "+cnt3;
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		
		

		return "/common/message";
	}
```


***

## 4. 신고 게시글 관리   

![신고게시글](https://user-images.githubusercontent.com/99188096/180407663-541a8767-0fbc-42ab-a484-3e7e36ff58ab.PNG)   

- 화살표 버튼 클릭시 해당 게시글로 이동
- 초록색 버튼 클릭시 해당 게시글 문제없음 판단, 신고 처리일자 입력
- 빨간색 버튼 클릭시 해당 게시글 문제있음 판단, 신고 처리일자 입력, 작성자 경고수 1 증가, 작성자 차단, 게시글 삭제 처리   


***

## 5. 상품관리 다중 조건 검색   

![가격](https://user-images.githubusercontent.com/99188096/180410442-45e1aa8c-3e4f-4948-8ed5-e3d74cac6e67.PNG)   


- 슬라이더 두개를 합쳐 범위 선택


```javascript
	function getVals(){
	  // Get slider values
	  var parent = this.parentNode;
	  var slides = parent.getElementsByTagName("input");
	    var slide1 = parseFloat( slides[0].value );
	    var slide2 = parseFloat( slides[1].value );
	  // Neither slider will clip the other, so make sure we determine which is larger
	  if( slide1 > slide2 ){ var tmp = slide2; slide2 = slide1; slide1 = tmp; }
	  
	  var displayElement = parent.getElementsByClassName("rangeValues")[0];
	      displayElement.innerHTML = slide1 + "원 - " + slide2 + "원";
	}

	window.onload = function(){
	  // Initialize Sliders
	  var sliderSections = document.getElementsByClassName("range-slider");
	      for( var x = 0; x < sliderSections.length; x++ ){
	        var sliders = sliderSections[x].getElementsByTagName("input");
	        for( var y = 0; y < sliders.length; y++ ){
	          if( sliders[y].type ==="range" ){
	            sliders[y].oninput = getVals;
	            // Manually trigger event first time to display values
	            sliders[y].oninput();
	          }
	        }
	      }
	}
	
$(function(){

	$('#searchBtn').click(function(){
		var priceMin = $('input[name=priceMin]').val();
		var priceMax = $('input[name=priceMax]').val();
		var cateNo = new Array();
		
		for(var i=0; i<$('input[name=cateNo]:checked').length; i++){
			cateNo[i] = $('input[name=cateNo]:checked').eq(i).val();
		}
		
		//location.href="<c:url value='/admin/mail/mailDetail?msgaddNo='/>"+msgaddNo+"&msgNo="+msgNo;
		//alert(msgaddNo);
		 $.ajax({
			url: "<c:url value='/admin/pd/ajaxpdSearch'/>",
			type: "GET",
			data: {
				"priceMin" : priceMin,
				"priceMax" : priceMax,
				"cateNo" : cateNo
				
				
			},
			success: function(data){
				$('#ajaxTarget').html(data);
			},
			error: function(xhr, status, error){
				alert('error:' + error);
			}
		}); 
	});
	
	$('#selectAllInput').change(function(){
		$('input[name=cateNo]').prop("checked",$('#selectAllInput').prop("checked"));
	});
});
```
