package com.sist.controller;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target(METHOD)
public @interface RequestMapping {
   public String value();
   // 어노테이션 => 기능은 없다 : 인덱스 역할 (찾기 쉽게) 
   // => if문 추가 => 간결하게 만든다 
   // => 리플렉션을 이용하기 때문 개발자가 메소드명 / 클래스명을 마음대로 할 수 있다
}
