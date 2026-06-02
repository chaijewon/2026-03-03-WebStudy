package com.sist.model;
// 메소드 => 어떻게 찾을까? 
// if => 대체 
/*
 *   클래스 검색 => Map (if을 제거)
 *   메소드 => (if 제거) => 구분자 찾기 => Annotation 
 *   => 리플렉션 => 메소드명과 관련이없이 자동 검색이 가능 => Spring 
 *   => Controller : 이미 업체마다 제작되어 있다 
 *      | Spring에서 제공하는 Controller 
 *             => 공기업 / 금융권 
 *      | 포털 : 자체에서 Controller 제작 
 *      
 *   MVC 구조 파악 
 *   ----------- Model(DAO,VO) => View(JSP,JavaScript)
 *                     --- MyBatis이해 
 *   
 */
public class FoodModel {
   // 1. 목록
   // 2. 상세보기 
   // 기타 : 좋아요 / 찜하기 / 예약하기 / 추천 / 근처 맛집 / 길찾기 / 검색 ...
}
