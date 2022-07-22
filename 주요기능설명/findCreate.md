# 크리에이터 찾기 주요 기능
- 1. 페이징 처리
- 2. Three.js의 반복처리   
- 3. ZipLoader를 이용 압축파일의 해제 없이 로딩

***

# 1. 페이징 처리
![리스트](https://user-images.githubusercontent.com/99188096/180380885-44f48458-83d8-4a04-aa09-b6cee910e677.PNG)   

- 일반회원중 포트폴리오가 등록된 회원만 노출
- 매퍼 sql문   
  - 검색조건과 페이징 처리 상수를 SearchVO에 파라미터로 담는다   

```html
<select id="selectAllCreater" resultType="MemberVO" parameterType="SearchVO">
		select * from (
			select rownum as RNUM, R.* from(
				select A.*, (select count(*) from fp_port B where A.mem_no = B.mem_no) as memItem, (select count(*) from fp_contact C where A.mem_no = C.mem_no) as memComplete  from fp_mem A where mem_no in (select mem_no from fp_port)
				<include refid="searchAndWhere"></include>
			) R
		)
		where
		RNUM>#{firstRecordIndex} 
		<![CDATA[	
		and RNUM<=#{firstRecordIndex} + #{recordCountPerPage} ]]>
</select>
```

- 뷰페이지에서 검색 혹은 페이지 이동 시 form   

```javascript
  <form name="frmPage" method="post"
		action="<c:url value='/creater/createrList'/>">
    
    //페이지 버튼 클릭시 현재 페이지를 담아 유지
		<input type="hidden" name="currentPage">
    
    //검색 이용시 페이지를 넘어가도 검색 조건이 유지되도록 검색 조건을 받아온다
		<input type="hidden" name="searchKeyword" value="${searchVo.searchKeyword }">

	</form>
```
- 컨트롤러   

```java
	@RequestMapping("/createrList")
	public void createrList(@RequestParam(required = false) String conFlag, @RequestParam(defaultValue = "0") int recNo
			, @ModelAttribute SearchVO searchVo,Model model) {
		logger.info("크리에이터 찾기 뷰");
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setBlockSize(ConstUtil.BLOCKSIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		logger.info("t ={}",pagingInfo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("t2={}",pagingInfo.getFirstRecordIndex());
		logger.info("t3={}",searchVo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		int totalRecord=0;
		List<MemberVO> list=null;
		int contractedMemNo=-1;
		if(recNo < 1) {
			//전체조회
			list =  memberService.selectAllCreater(searchVo);
			logger.info("크리에이터 찾기 list={}",list);
			
			totalRecord = memberService.getTotalRecord(searchVo);
			
		}else { //기업의뢰 지원자 현황
			String searchKeyword = searchVo.getSearchKeyword();
			int firstRecordIndex = searchVo.getFirstRecordIndex();
			int recordCountPerPage = searchVo.getRecordCountPerPage();
			Map<String, Object> map = new HashMap<>();
			map.put("searchKeyword", searchKeyword);
			map.put("recNo", recNo);
			map.put("firstRecordIndex", firstRecordIndex);
			map.put("recordCountPerPage", recordCountPerPage);
			
			list = memberService.selectCreaterByRecNo(map);
			logger.info("기업의뢰 지원자 현황, list.size={}", list.size());
			
			totalRecord = memberService.getTotalRecordByrecNo(map);
			
			//계약 멤버 조회
			if(!conFlag.equals("recruiting")) {
				contractedMemNo = commissionService.selectMemNoByRecNo(recNo);
			}
		}
		
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("크리에이터 목록 조회-레코드 개수, totalRecord={}", totalRecord);
		logger.info("크리에이터 목록 조회-pagingInfo, pagingInfo.getFirstPage={}", pagingInfo.getFirstPage());
		logger.info("크리에이터 목록 조회-pagingInfo, pagingInfo.getLastPage={}", pagingInfo.getLastPage());
		
		model.addAttribute("searchVo",searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("list",list);
		model.addAttribute("recNo", recNo);
		model.addAttribute("conFlag", conFlag);
		model.addAttribute("contractedMemNo", contractedMemNo);
	}
```


***

# 2. Three.js의 반복처리
- Three.js의 scene을 담을 canvas 필요
- 3d모델링을 읽어올 각각의 script 필요
- jstl의 c코어를 이용, for each문을 통해 캔버스를 3d모델 수 만큼 반복 생성한다
  - script문에서 각각의 canvas를 이어주기 위해 서로 다른 아이디로 생성
  - 자바스크립트 문 또한 반복문으로 생성
    - 자바스크립트 타입을 모듈로 하여 서로 변수명이 충돌하지 않도록 한다

```javascript

<!-- 외부 js파일은 불필요한 중복을 방지하기 위해 forEach문 밖에 선언 -->
<script src="https://rawgit.com/mrdoob/three.js/dev/build/three.js"></script>
<script src="https://rawgit.com/mrdoob/three.js/dev/examples/js/loaders/GLTFLoader.js"></script>
<script src="https://cdn.rawgit.com/takahirox/THREE.ZipLoader/v0.0.1/build/ziploader.min.js"></script>
<script src="https://unpkg.com/three@0.141.0/examples/js/controls/OrbitControls.js"></script>


    <section class="portfolio ptb80">
        <div class="container">

            <div class="row">
                <h3 class="text-center pb60">Recent Work</h3>

                
            </div>

            <!-- Start of Portfolio Grid -->
            <div class="row portfolio-grid mt40">
				
        
        <!-- 반복문 시작 -->
				<c:forEach var="portfolioVo" items="${portfolioList }">
				
                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat1">
                    
                    
                      <!-- 캔버스 아이디에 포트폴리오 번호를 같이 선언해줌으로써 반복문이 돌때 서로 다른 아이디의 캔버스 생성 -->
                    	<canvas id="can${portfolioVo.portNo }" width="360px" height="270px" style="margin-bottom:0"></canvas>

<script type="module">

	var url = "<c:url value='/gltfmodel/${portfolioVo.portFilename}'/>";

	var manager = new THREE.LoadingManager();
	
	var scene = new THREE.Scene();
	var renderer = new THREE.WebGLRenderer({
		canvas : document.querySelector('#can${portfolioVo.portNo}'), //반복문 속에서 각각의 캔버스 매칭
		antialias : true
	});
	renderer.outputEncoding = THREE.sRGBEncoding;
	
	var camera = new THREE.PerspectiveCamera(30,1);
	camera.position.set(0,0,5)
	
	let controls = new THREE.OrbitControls(camera, renderer.domElement);
	controls.update();

	scene.background = new THREE.Color('white');


	const grid = new THREE.GridHelper( 20, 20, 0x000000, 0x000000 );
	grid.material.opacity = 0.2;
	grid.material.transparent = true;
	grid.position.y = -1;
	scene.add( grid );

	new Promise( function( resolve, reject ) {

		if ( url.match( /\.zip$/ ) ) {

			new THREE.ZipLoader().load( url ).then( function( zip ) {

				manager.setURLModifier( zip.urlResolver );

				resolve( zip.find( /\.(gltf|glb)$/i )[ 0 ] );

			} );

		} else {

			resolve( url );

		}

	} ).then( function ( file ) {

		new THREE.GLTFLoader( manager ).load( file, function ( gltf ) {

			scene.add( gltf.scene );
			function animate(){
				requestAnimationFrame(animate)
				controls.update();
				renderer.render(scene,camera);
				gltf.scene.rotation.y += 0.005;
			}
			animate();


		} );

	} );
</script>
                </div>
                
                </c:forEach>
```


***

## 3. ZipLoader를 이용 합축파일의 해제 없이 로딩
- zip 로더 이용 압축파일 내부를 순회
- 원하는 확장자명의 을 찾으면 해당 파일 로드

```javascript
new Promise( function( resolve, reject ) {

		if ( url.match( /\.zip$/ ) ) {

			new THREE.ZipLoader().load( url ).then( function( zip ) {

				manager.setURLModifier( zip.urlResolver );

				resolve( zip.find( /\.(gltf|glb)$/i )[ 0 ] );

			} );

		} else {

			resolve( url );

		}

	} ).then( function ( file ) {

		new THREE.GLTFLoader( manager ).load( file, function ( gltf ) {

			scene.add( gltf.scene );
			function animate(){
				requestAnimationFrame(animate)
				controls.update();
				renderer.render(scene,camera);
				gltf.scene.rotation.y += 0.005;
			}
			animate();


		} );
```
