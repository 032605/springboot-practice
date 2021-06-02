package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Member {
	private int id;
	private String me_id;
	private String me_password;
	private String me_nickname;
	private int me_singup_type;
}
