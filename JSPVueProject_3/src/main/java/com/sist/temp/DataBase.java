package com.sist.temp;
/*
 *     비정규화
 *     empno  ename  job  deptno  dname  loc
 *     1111   홍길동  사원    10     개발부   서울
 *     2222   심청이  대리    20     영업부   부산
 *     3333   박문수  대리    20     영업부   부산
 *     4444   이순신  과장    30     총무부   경기
 *     
 *     1. 문제점 
 *        부서명이 여러번 반복 
 *        근무지  여러번 반복 
 *        --> 반복 변경시의 여러 행 수정
 *      => 이상현상 방지 / 사용이 쉽게 제어 
 *   1) 1정규화 : 한가지값만 첨부 
 *      name   hobby  ==> name : 완전 함수 종속 
 *      홍길동   수영,등산,여행  ==> 수정이 어렵다 
 *       => 모든 컬럼은 원자값을 가지고 있다 
 *                   ----- 단일 데이터를 가지고 있다
 *      
 *      name hobby 
 *      홍길동  수영 
 *      홍길동  등산 
 *      홍길동  여행 
 *         => id name 
 *         => id hobby
 *      ----------------- (name+hobby) : 부분적 함수 종속 
 *              => 기본키 + 복합키 
 *              id / jumin
 *      empno / jumin / job / ename
 *      
 *      empno ename job
 *      empno jumin 
 *      
 *   2) 2정규화 : 부분 함수 종속 제거 (결정자가 2개인 경우)
 *                               ----- primary
 *   3) 3정규화 : 이행 함수 종속 제거 
 *               => 기능이 다른 경우에 분리해ㅔ서 테이블 제작 
 *      empno  ename  job  deptno  dname  loc
 *      empno -> deptno 
 *      deptno -> dname , loc 
 *      
 *      empno -> dname
 *      empno -> loc 
 *      
 */
public class DataBase {

}
