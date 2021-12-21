package dao; 

import java.util.List;
import javax.servlet.http.HttpSession;
import com.care.dare.join.controller.*; 
public interface MemberDao {
	// 회원가입 메소드 
	public void memberJoinMethod(MemberDTO dto) ; 
	// 로그인
	public MemberDTO login(MemberDTO dto);
	}


