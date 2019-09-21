package com.exam.app.common.model;

import java.io.Serializable;

import lombok.NoArgsConstructor;

import lombok.ToString;

import lombok.Setter;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TestDTO implements Serializable{

	private String id;
	private String pw;
}
