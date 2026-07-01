package com.sist.vo;

import jakarta.websocket.Session;
import lombok.Data;
@Data
public class ChatVO {
   private String id,name;
   private Session session;
}
