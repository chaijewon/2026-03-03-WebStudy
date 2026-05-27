package com.sist.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
// <% %> : 자바 / HTML => 분리 
//               => JSP 
//         Model / View ==> MV구조 => <% %> => 남아 있다 => Controller
// JSP => 태그형만 남긴다 
/*
 *   JSP => 일회용 => 확장 / 유지보수가 불가능 (재사용이 안된다) 
 *                  ------------ MVC (Back / Front)
 *                  Spring에서는 JSP 배제 => HTML , React / Vue
 *   
 *    
 */
public class DataVO {
  // 데이터 마인닝 => 꼬꼬마 (형태소 분석) => 라이브러리 
  private String word;
  private int count;
}
