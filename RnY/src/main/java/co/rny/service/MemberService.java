package co.rny.service;

import java.util.List;

import co.rny.common.SearchVO;
import co.rny.vo.AddressVO;
import co.rny.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> memberList(int page); // ����紐⑸�
	List<MemberVO> memberList(SearchVO search); // ����紐⑸�
	List<AddressVO> myaddressList(AddressVO avo);
	MemberVO userinfo(String userNo); // �������� 
	boolean removemember(String userNo); // ��������
	
	boolean addMember(MemberVO mvo); // ����媛���
	boolean address(AddressVO avo); // ����媛���
	
	int selectId(String id); // ����媛���(ID以�蹂듭껜��)
	int selectEmail(String email); // ����媛���(ID以�蹂듭껜��)
	
	MemberVO loginCheck(String id, String pw); // 濡�洹몄��
	String userNick(String id); // ���ㅼ��
	String userName(String id); // �대�
	String userCheck(String id); // ����踰���
	
	int totalCount(SearchVO search); // ���댁� 怨��곗�� 嫄댁��
	MemberVO memberpage(int userNo);
	
	boolean modifymember(MemberVO mvo); // ������蹂댁����
	boolean modifyaddress(AddressVO avo); // 二쇱������
	boolean removeadd(String mainAdd); // �������
	
}
