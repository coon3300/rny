package co.rny.vo;

import lombok.Data;

@Data
public class AddressVO extends MemberVO{
	private String addName;
	private String recipient;
	private String addPhone;
	private String newAddress;


}
