<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/adminHeader.jsp" %>

<link href="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">



<!-- ckeditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/super-build/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/super-build/translations/ko.js"></script>
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>


<script>
$(function(){
	$('#writeBtn').click(function(){
		 var cnt = 0;
		 
		 document.forms[0].mailScope.forEach(element => {       //element는 name이 hobby인 input 요소 입니다.
	          //alert(`배열요소 ${element.value} : ${element.checked}`)
	          if(element.checked) cnt++;
	      });
		 
		 if($('#boardTitle').val().length < 1){
			alert('제목을 입력하세요');
			event.preventDefault();
			$('#boardTitle').focus();
		}else if(cnt == 0){
			alert('발송 범위를 선택해주세요');
			event.preventDefault();
		}else{
			$('#frm-write').submit();
		} 
		 
	      

		
		
	});
});





</script>
				<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-2 text-gray-800">공지 발송</h1>
                    </div>
                    
                
                    
						<form method="post" action="<c:url value='/admin/mail/sendAll'/>" id="frm-write">
                    	<div class="row">

	                        <div class="col-lg-8">

	                            <!-- Basic Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">제목</h6>
	                                </div>
	                                <div class="card-body">
		                                
	                                    <input type="text" class="form-control bg-white border-1 small border-left-info" placeholder="글 제목을 입력하세요..."
                                		aria-label="Search" aria-describedby="basic-addon2" name="msgTitle" id="boardTitle">
	                                   
	                                </div>
	                            </div>
	                            
	                            
	                            <!-- Basic Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">내용</h6>
	                                </div>
	                                
		                                
	                                    <textarea class="form-control bg-white border-1 small border-left-info" placeholder="글 내용을 입력하세요..."
                                		aria-label="Search" aria-describedby="basic-addon2" rows="18" name="msgContent" id="boardContent"></textarea>
                                		
                                		
									    <script>
									    CKEDITOR.ClassicEditor.create(document.getElementById("boardContent"), {
							                language:'ko',
							                toolbar: {
							                    items: [
							                        'exportPDF','exportWord', '|',
							                        'findAndReplace', 'selectAll', '|',
							                        'heading', '|',
							                        'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
							                        'bulletedList', 'numberedList', 'todoList', '|',
							                        'outdent', 'indent', '|',
							                        'undo', 'redo',
							                        '-',
							                        'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
							                        'alignment', '|',
							                        'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
							                        'specialCharacters', 'horizontalLine', 'pageBreak', '|',
							                        '|',
							                        'sourceEditing'
							                    ],
							                    shouldNotGroupWhenFull: true
							                },
							                list: {
							                    properties: {
							                        styles: true,
							                        startIndex: true,
							                        reversed: true
							                    }
							                },
							                heading: {
							                    options: [
							                        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
							                        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
							                        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
							                        { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
							                        { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
							                        { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
							                        { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
							                    ]
							                },
							                // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
							                placeholder: '글 내용을 입력하세요...',
							                // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
							                fontFamily: {
							                    options: [
							                        'default',
							                        'Arial, Helvetica, sans-serif',
							                        'Courier New, Courier, monospace',
							                        'Georgia, serif',
							                        'Lucida Sans Unicode, Lucida Grande, sans-serif',
							                        'Tahoma, Geneva, sans-serif',
							                        'Times New Roman, Times, serif',
							                        'Trebuchet MS, Helvetica, sans-serif',
							                        'Verdana, Geneva, sans-serif'
							                    ],
							                    supportAllValues: true
							                },
							                fontSize: {
							                    options: [ 10, 12, 14, 'default', 18, 20, 22 ],
							                    supportAllValues: true
							                },

							                htmlSupport: {
							                    allow: [
							                        {
							                            name: /.*/,
							                            attributes: true,
							                            classes: true,
							                            styles: true
							                        }
							                    ]
							                },

							                htmlEmbed: {
							                    showPreviews: true
							                },
							                link: {
							                    decorators: {
							                        addTargetToExternalLinks: true,
							                        defaultProtocol: 'https://',
							                        toggleDownloadable: {
							                            mode: 'manual',
							                            label: 'Downloadable',
							                            attributes: {
							                                download: 'file'
							                            }
							                        }
							                    }
							                },
							                // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
							                mention: {
							                    feeds: [
							                        {
							                            marker: '@',
							                            feed: [
							                                '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
							                                '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
							                                '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
							                                '@sugar', '@sweet', '@topping', '@wafer'
							                            ],
							                            minimumCharacters: 1
							                        }
							                    ]
							                },
							                // The "super-build" contains more premium features that require additional configuration, disable them below.
							                // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
							                removePlugins: [
							                    // These two are commercial, but you can try them out without registering to a trial.
							                    // 'ExportPdf',
							                    // 'ExportWord',
							                    'CKBox',
							                    'CKFinder',
							                    'EasyImage',
							                    // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
							                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
							                    // Storing images as Base64 is usually a very bad idea.
							                    // Replace it on production website with other solutions:
							                    // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
							                    // 'Base64UploadAdapter',
							                    'RealTimeCollaborativeComments',
							                    'RealTimeCollaborativeTrackChanges',
							                    'RealTimeCollaborativeRevisionHistory',
							                    'PresenceList',
							                    'Comments',
							                    'TrackChanges',
							                    'TrackChangesData',
							                    'RevisionHistory',
							                    'Pagination',
							                    'WProofreader',
							                    // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
							                    // from a local file system (file://) - load this site via HTTP server if you enable MathType
							                    'MathType'
							                    
							                ]
							            });
									    
									    
									    </script>
									    
									    
	                                   
	                                
	                            </div>
	
	                        </div>
	                        
	                        <div class="col-lg-4">

	                            <!-- Basic Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">발송 범위</h6>
	                                </div>
	                                <div class="card-body">
	                                	<nav class="navbar navbar-expand navbar-light bg-light mb-4">
	                                        
	                                        <div class="form-check">
											    <input class="form-check-input" id="normal" type="checkbox" name="mailScope" value="1">
											    <label class="form-check-label" for="normal">일반회원</label><br>
											
											    <input class="form-check-input" id="company" type="checkbox" name="mailScope" value="2">
											    <label class="form-check-label" for="company">기업회원</label><br>
											
											    <input class="form-check-input" id="manager" type="checkbox" name="mailScope" value="3">
											    <label class="form-check-label" for="manager">관리자</label><br>
											</div><br>
	                                    </nav>
	                                    <input type="hidden" name="btypeNo" id="btypeNo">
                                        
                                        
                                        <button class="btn btn-primary btn-lg btn-block mt-4" type="button" id="writeBtn">
                                            발송
                                        </button>
                                
	                                </div>
	                            </div>
	
	                        </div>
	                        
	                        
	                        
                        </div>
						</form>



                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            
	<!-- Page level plugins -->
	<script src="<c:url value='/admin/vendor/datatables/jquery.dataTables.min.js'/>"></script>
	<script src="<c:url value='/admin/vendor/datatables/dataTables.bootstrap4.min.js'/>"></script>
	
	<!-- Page level custom scripts -->
	<script src="<c:url value='/admin/js/demo/datatables-demo.js'/>"></script>

<%@ include file="../inc/adminFooter.jsp" %>
