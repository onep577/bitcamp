<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<div class="modal-dialog" role="document">
    <div class="modal-content">
		<div class="modal-header">
        	<h5 class="modal-title" id="exampleModalLabel">적립금 상세</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<form id="_detail_frm">
				<c:forEach items="${cols }" var="col" varStatus="i" step="1">
					<div class="col-md-8" align="center">
						<div class="input-group frm-input-row">
					        <div class="input-group-prepend">
					          <span class="input-group-text" id="_frm_${col }" style="width:120px;">${col }</span>
					        </div>
					        <c:choose>
					        	<c:when test="${i.index > 1 && i.index < 5 }">
					        		<input type="text" class="form-control detail-input-items" id="_detail_${i.index }">
					        	</c:when>
					        	<c:otherwise>
					        		<input type="text" class="form-control detail-input-items" id="_detail_${i.index }" readonly>
					        	</c:otherwise>					        
					        </c:choose>
					    </div>
				    </div>
				</c:forEach>		
        	</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary" id="_frm_btn_save" disabled>저장</button>
		</div>
	</div>
</div>
	
</html>