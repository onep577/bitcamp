package com.exboot.common.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TestDTO implements Serializable {
	
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String auth;

}
