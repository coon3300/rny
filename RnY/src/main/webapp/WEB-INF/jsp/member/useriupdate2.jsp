<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


    <div class="container">
        <h1>MODIFY</h1>
        <form action="updateuser.do" method="post">
        
            <div class="form-group">
                <label for="id">아이디 *</label>
                <input type="text" id="id" name="id" value="3281939966@n" disabled>
            </div>
            
            <div class="form-group">
                <label for="password">비밀번호 *</label>
                <input type="password" id="password" name="password" placeholder="Password">
            </div>
            
            <div class="form-group">
                <label for="confirm_password">비밀번호 확인 *</label>
                <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password">
            </div>
            
            <div class="form-group">
                <label for="name">이름 *</label>
                <input type="text" id="name" name="name" value="허리야" disabled>
            </div>
            
            <div class="form-group">
                <label for="phone1">일반전화</label>
                <select id="phone1" name="phone1">
                    <option value="02">02</option>
                    <!-- 다른 지역번호 추가 가능 -->
                </select>
                <input type="text" id="phone2" name="phone2" placeholder="0000">
                <input type="text" id="phone3" name="phone3" placeholder="0000">
            </div>
            
            <div class="form-group">
                <label for="mobile">휴대전화 *</label>
                <select id="mobile_prefix" name="mobile_prefix">
                    <option value="010">010</option>
                    <!-- 다른 번호 추가 가능 -->
                </select>
                <input type="text" id="mobile" name="mobile" value="8188" placeholder="8188">
                <input type="text" id="mobile_last" name="mobile_last" value="8884" placeholder="8884">
            </div>
            
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" id="zipcode" name="zipcode" placeholder="우편번호">
                <button type="button">주소검색</button>
                <input type="text" id="address" name="address" placeholder="기본주소">
                <input type="text" id="address_detail" name="address_detail" placeholder="나머지 주소 (선택 입력 가능)">
            </div>
            
            <div class="form-group">
                <label for="email">이메일 *</label>
                <input type="email" id="email" name="email" value="vampire_hy@naver.com" disabled>
            </div>
            
            <p class="note">회원 정보를 입력하시면 하단의 버튼을 클릭하세요.</p>
            <button type="submit">회원정보 수정</button>
            <button type="button" class="cancel">취소</button>
        </form>
    </div>

