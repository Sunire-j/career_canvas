package com.team1.careercanvas.mapper;

import com.team1.careercanvas.vo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PofolMapper {
	// 권혁준 작업
	List<PofolVO> getPofol(PagingVO pVO);

	int getPofolCount(PagingVO pVO);

	// 김효준작업
	int getpofolamount(String userid);

	List<PofolVO> getPofolInfo(PagingVO pvo);

	int isLike(int no, String userid);

	void pofolLike(int no, String userid);

	void reportPofol(int target_id, String userid, String title, String user_userid);

	int deletePofol(int pofolid);

	PofolVO getPofolall(int pofolid);

	int getpofollike(int pofolid);

	int insertImg(String path, int pofolid);

	CompanyVO companyprofile(String user_userid);

	// 권혁준 작업

	List<PofolVO> getPublicSoloPofol(PagingVO pVO);

	List<PofolVO> getPublicTeamPofol(PagingVO pVO);

	int getTotalSoloPofol(PagingVO pVO);

	int getTotalTeamPofol(PagingVO pVO);

	// 조석훈 작업
	List<PofolVO> getPortfolioForHome();

	List<PofolVO> getPortfolioForHomeWithCat(int category);

	List<UserVO> getMemberListForEdit(int partyid);

	void updatePofol(PofolVO pvo);

	void deletePofolCont(PofolVO pvo);
	String getOldImg(int pid);

	void updateImg(String path, int pid);
	// 정인식 작업
	List<UserVO> getMemberList(int partyid);

	void ViewsCount(int pofolid);

	List<UserVO> getSelectMemberList(int pofolid);
	// 정인식 작업 끝

	List<PartyVO> getPartyList(String logId);
}
