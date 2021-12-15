package dao; 

import java.util.List;
import javax.servlet.http.HttpSession;
import dto.MemberDTO; 
public interface MemberDAO {
	// 회원가입 메소드 
	public void memberJoinMethod(MemberDTO dto); 
	}


