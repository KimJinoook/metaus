# 데이터의 처리   
- 1. chart.js
- 2. sheet.js

***

## 1. chart.js   

![관리자페이지](https://user-images.githubusercontent.com/99188096/180397359-08f57995-2c28-4fc1-99a1-6f15ce5674b5.PNG)   


- 방문자수 chart
  - 현재 일자로부터 일주일 전까지의 날짜를 구해 chart의 각 컬럼에 전달
  - db에서 현재일자로부터 일주일 전까지 각 날짜별 방문자수를 chart의 각 컬럼에 전달   


- 데이터 추출 controller   

```java
@RequestMapping("/")
	public String index(Model model) {
		int todayVisit = visitService.todayVisit();
		int totalVisit = visitService.totalVisit();
		
		
		
		Date d = new Date();
		System.out.println(d);
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String a = sdf.format(d);
		System.out.println(a);
		
		Calendar today = Calendar.getInstance();
		System.out.println(today.MONTH+"월 "+today.DATE+"일");
		d = today.getTime();
		
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<Integer> visitList = new ArrayList<Integer>();
		
		String days = sdf.format(d);
		System.out.println(days);
		list.add(days);
		int visit = visitService.selectVisitByDate(days);
		System.out.println(visit);
		visitList.add(visit);
		for(int i=0; i<6; i++) {
			today.add(Calendar.DATE, -1);
			d = today.getTime();
			days = sdf.format(d);
			System.out.println(today.get(Calendar.MONTH)+1+"-"+today.get(Calendar.DATE));
			list.add(days);
			visit = visitService.selectVisitByDate(days);
			visitList.add(visit);
		}
		System.out.println(list);
		
		int totalMem = memberService.getAllMemNoPort();
		int totalCre = memberService.getTotalRecord(null);
		int totalCom = companyService.selectAllCount();
		
		int a1=6;
		int a2=1;
		int a3 = a2*100/a1;
		System.out.println(a3);
		
		int totalRec = companyService.selectRecCount();
		int totalCon = companyService.selectConCount();
		int totalConNotEnd = companyService.selectConCountNotEnd();
		int totalConEnd = companyService.selectConCountEnd();
		
		int conRate = 0;
		int conEndRate = 0;
		if(totalRec>0) {
			conRate = totalCon*100/totalRec;
		}
		if(totalCon>0) {
			conEndRate = totalConEnd*100/totalCon;
		}
		
		String sumPayToday = memberService.sumPayToday();
		if(sumPayToday == null || sumPayToday.isEmpty()) {
			sumPayToday="0";
		}
		
		model.addAttribute("todayVisit",todayVisit);
		model.addAttribute("totalVisit",totalVisit);
		model.addAttribute("daysforvisit",list);
		model.addAttribute("visitfordays",visitList);
		model.addAttribute("curVisit",VisitListener.getActiveSessions());
		model.addAttribute("totalMem",totalMem);
		model.addAttribute("totalCre",totalCre);
		model.addAttribute("totalCom",totalCom);
		model.addAttribute("conRate",conRate);
		model.addAttribute("conEndRate",conEndRate);
		model.addAttribute("sumPayToday",sumPayToday);
		
		
		return "/admin/index";
	}
	
```

- 뷰페이지에서 데이터를 받은 후 chart.js로 전달   

```html
<!-- 방문자 수 데이터 -->
<c:forEach var="i" begin="1" end="${visitfordays.size() }">
  <input type="hidden" id="d${i}" value="${daysforvisit[i-1] }">
  <input type="hidden" id="v${i}" value="${visitfordays[i-1] }">
</c:forEach>

<!-- 회원 비율 데이터 -->
<input type="hidden" id="totalMem" value="${totalMem }">
<input type="hidden" id="totalCre" value="${totalCre }">
<input type="hidden" id="totalCom" value="${totalCom }">
```

- chart.js에서의 처리   

```javascript

var ctx = document.getElementById("myAreaChart");

// 일자 컬럼 
var days = [$('#d7').val(),$('#d6').val(),$('#d5').val(),$('#d4').val(),$('#d3').val(),$('#d2').val(),$('#d1').val()];
// 일자별 방문자수 컬럼
var visits = [$('#v7').val(),$('#v6').val(),$('#v5').val(),$('#v4').val(),$('#v3').val(),$('#v2').val(),$('#v1').val()];
var myLineChart = new Chart(ctx, {
  type: 'line', //선형 데이터
  data: {
    labels: days,
    datasets: [{
      label: "방문자수",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: visits,
    }],
  },
  이하 생략
```

***

## 2. sheet.js
- 회원관리, 게시판관리등의 테이블 데이터를 sheet.js를 이용 엑셀로 변환
- 변환한 파일을 FileSaver.js를 이용 arraybuffer에 담아 파일 다운로드   

```javascript
function exportExcel(){ 
  // step 1. workbook 생성
  var wb = XLSX.utils.book_new();

  // step 2. 시트 만들기 
  var newWorksheet = excelHandler.getWorksheet();

  // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
  XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

  // step 4. 엑셀 파일 만들기 
  var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

  // step 5. 엑셀 파일 내보내기 
  saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
}

var excelHandler = {
    getExcelFileName : function(){
        return '일반회원조회.xlsx';	//파일명
    },
    getSheetName : function(){
        return '일반회원';	//시트명
    },
    getExcelData : function(){
        return document.getElementById('dataTable'); 	//TABLE id
    },
    getWorksheet : function(){
        return XLSX.utils.table_to_sheet(this.getExcelData());
    }
}

function s2ab(s) { 
  var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
  var view = new Uint8Array(buf);  //create uint8array as viewer
  for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
  return buf;    
}
```
