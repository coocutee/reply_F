<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

 <!-- �¿����� ���� Ȯ�� -->
        <div class="container">
            <hr/>
            <div class="row">
                <div class="col-md-10">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                                <th width="10%">����</th>
                                <th width="60%">�Խ��� ���� �Դϴ�.</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>�ۼ���
                                </td>
                                <td>
                                2014-12-15 04:45:23
                                </td>
                            </tr>
                            <tr>
                                <td>�۾���
                                </td>
                                <td>
                                husk <span style='float:right'>��ȸ : 0</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <p>�̸�, �н����� ������ �����ð� Ȯ�ι�ư�� ��������.</p>
                        
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table id="commentTable" class="table table-condensed"></table>
                    <table class="table table-condensed">
                        <tr>
                            <td>
                                <span class="form-inline" role="form">
                                    <p>
                                        <div class="form-group">
                                            <input type="text" id="commentParentName" name="commentParentName" class="form-control col-lg-2" data-rule-required="true" placeholder="�̸�" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="commentParentPassword" name="commentParentPassword" class="form-control col-lg-2" data-rule-required="true" placeholder="�н�����" maxlength="10">
                                        </div>
                                        <div class="form-group">
                                            <button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">Ȯ��</button>
                                        </div>
                                    </p>
                                        <textarea id="commentParentText" class="form-control col-lg-12" style="width:100%" rows="4"></textarea>
                                </span>
                            </td>
                        </tr>
                    </table>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                                    <span style='float:right'>
                                        <button type="button" id="list" class="btn btn-default">���</button>
                                        <button type="button" id="modify" class="btn btn-default">����</button>
                                        <button type="button" id="delete" class="btn btn-default">����</button>
                                        <button type="button" id="write" class="btn btn-default">�۾���</button>
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
	
	
	
	
</body>
</html>