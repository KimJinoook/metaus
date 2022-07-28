# 포트폴리오 주요기능
- 1. Three.js의 반복처리   
- 2. ZipLoader를 이용 압축파일의 해제 없이 로딩  

# 1. Three.js의 반복처리

(![포트폴리오](https://user-images.githubusercontent.com/107232180/181446912-9f89db78-2bad-42a1-b547-31a5f5e465d9.png)
)   


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
    <!-- ===== Start of Portfolio Section ===== -->
    <section class="portfolio2 ptb80">
        <div class="container">

            <div class="row">
                <h3 class="text-center pb60">포트폴리오</h3>

                <!-- Filter Buttons -->
                
            </div>

            <!-- Start of Portfolio Grid -->
            <div class="row portfolio-grid mt40">

                <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat1">
                    <figure>
                        <a href="<c:url value='/resume/portfolio'/>" class="">
                            <img src="<c:url value='/images/portfolio/plus.png'/>" class="img-responsive" id="portfolio" alt="">
                        </a>
                    </figure>
                </div>
                
           	 <!-- 반복문 시작 -->
                <c:if test="${!empty list }">
                <c:forEach var="vo" items="${list }">
               <!-- Portfolio Item -->
                <div class="element col-md-4 col-sm-6 col-xs-6 portfolio-cat1">
                    <a href="<c:url value='/resume/portfolioDetail?portNo=${vo.portNo }'/>" class="">
		    
		    	 <!-- 캔버스 아이디에 포트폴리오 번호를 같이 선언해줌으로써 반복문이 돌때 서로 다른 아이디의 캔버스 생성 -->
                    	<canvas id="can${vo.portNo }" width="360px" height="360px" style="margin-bottom:0" class="img-responsive" id="portfolio"></canvas>
					</a>
<script type="module">

	var url = "<c:url value='/gltfmodel/${vo.portFilename}'/>";

	var manager = new THREE.LoadingManager();
	
	var scene = new THREE.Scene();
	var renderer = new THREE.WebGLRenderer({
		canvas : document.querySelector('#can${vo.portNo}'), //반복문 속에서 각각의 캔버스 매칭
		antialias : true
	});
	renderer.outputEncoding = THREE.sRGBEncoding;
	
	var camera = new THREE.PerspectiveCamera(30,1);
	camera.position.set(0,0,5)
	

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
				renderer.render(scene,camera);
				gltf.scene.rotation.y += 0.005;
			}
			animate();


		} );

	} );
</script>
                    
                </div>
                
                </c:forEach>
                </c:if>
                
				
            </div> 
			
        </div>
                        
    </section>


***

## 2. ZipLoader를 이용 압축파일의 해제 없이 로딩
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
				renderer.render(scene,camera);
				gltf.scene.rotation.y += 0.005;
			}
			animate();


		} );
```
