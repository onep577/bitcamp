<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<!-- ajax 통신을 위한 meta tag -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
 
<script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>
<script src="<%=ctx%>/vendor/ckeditor/ckfinder/ckfinder.js"></script>

<script src="<%=ctx%>/js/member/mypage/content/sub/review_write_new.js"></script>
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/sub/review_write_new.css">
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/content_layout.css">

<div class="mypage_main_content_top">
	<div class="top_title mypage_main_content_title" align="left">
		<h3>상품후기</h3>
		<hr>
	</div>
</div>


<!-- 후기대상 주문정보 -->
<div class="review_item_desc">
	<div class="form-group">
		<div class="form-row">
			<div class="col-md-2 img_waiting_item">
				<img src="<%=ctx %>/upload/store/${dto.img }" onerror="this.src='https://i.ytimg.com/vi/vWMCCZEkrKg/maxresdefault.jpg'">
			</div>
			<div class="col-md-5 detail_waiting_item">
				<div class="form-row">${dto.p_name }</div>
				<div class="form-row">${dto.p_title }</div>
				<div class="form-row">${dto.ea }개 구매</div>
			</div>
		</div>
	</div>
</div>
	

<div class="form-group" id="_new_review_wrap" align="left">	
	 <!-- Form -->
	<div id="_frm_new_review">	
	<div class="form-row">
		<div class="col-md-12 img_waiting_item">
			<label for="_review_title">후기 제목</label>
			<input type="text" id="_review_title" name="title" class="form-control" placeholder="제목을 입력해 주세요.">
		</div>        
	</div>
	
	<div class="form-row">
		<div class="col-md-12 img_waiting_item">
			<label for="review_editor">내용</label>
			<div class="editor_wrap">
				<textarea name="content" id="review_editor" placeholder="후기 내용을 입력해 주세요."></textarea>
			</div>
		</div>        
	</div>	
	<input type="hidden" name="userid" id="_frm_userid" value="${userloginid }">
	<input type="hidden" name="seq" id="_frm_seq" value="${dto.seq }">
	</div>
	<!-- Form -->
	<div class="frm-btn-wrap" align="center">
		<input type="button" class="btn btn-rhy-full" value="등록하기" id="btn_save" disabled>
		<input type="button" class="btn btn-rhy-border" value="돌아가기" id="btn_cancel">
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="confirmBack" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">      
      <div class="modal-body">
        	<br><a></a><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-rhy-full" id="_modal_confirm">돌아가기</button>
      </div>
    </div>
  </div>
</div>


<!-- CKEditor -->
<script type="text/javascript">
var myEditor;
ClassicEditor
	.create( document.querySelector( '#review_editor' ), {
		ckfinder: {
	        uploadUrl: '/ck/fileupload' // 내가 지정한 업로드 url (post로 요청감)
		},
		alignment: {
            options: [ 'left', 'center', 'right' ]
        }
	} )
	.then( editor => {
        console.log( 'Editor was initialized', editor );
        myEditor = editor;
    } )
	.catch( error => {
	    console.error( error );
	} );
</script>

</html>