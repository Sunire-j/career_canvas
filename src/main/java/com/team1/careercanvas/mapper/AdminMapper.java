package com.team1.careercanvas.mapper;

import com.team1.careercanvas.vo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {
    List<UserVO> getUserProfile(PagingVO pvo);

    List<BoardVO> getBoardList(PagingVO pvo);

    List<CompanyVO> getCompanyListForHome();

    List<ReportVO> getReportList(PagingVO pvo);

    String getAdminName(String username);

    List<SubjectVO> getDeleteList(PagingVO pvo);

    int deleteAssignment(int subjectid);

    int dismissSubject(int subjectid);

    int deleteBoard(int postid);

    int deleteReport(int targetid);

    int deleteWanted(int wantedid);

    int deleteComment(int commentid);

    int deleteWantedComment(int commentid);

    int deleteUser(String userid);

    int deletePP(int portfolioid);

    int deleteSubject(int applyid);

    String getWriterUser(int postid);

    String reporterUser(int target_id);

    int changeUsername(String userid, String changed);

    int getUserCount();

    int getCompanyCount();

    int getBoardCount();

    int getReportCount();

    int getDeleteCount();

    int getBoardToday();

    List<BoardVO> getBoardMonth();

    List<BoardVO> getBoardCategory();

    List<UserVO> getNewMember();

    List<UserVO> getAccessor();

    int getTodayAccessor();

    int getAllAccessor();

    int reportToday();

    int todatNewMember();


    // 권혁준작업
    List<BannerVO> getBannerList();

    int getBannerAmount(PagingVO pVO);

    //조석훈 작업

    int InsertBanner(BannerVO bvo);

    void InsertBannerimg(String imgsrc, int bannerid);

    String getBannerImg(int bannerid);

    void deleteBanner(int bannerid);

    List<BannerVO> getBannerListForHome();

    List<CompanyVO> getCompanyList(PagingVO pvo);

    String getAuthimg(String userid);

    void acceptCompany(String userid);

    void denyCompany(String userid);

    void reportApply(ReportVO rvo);

    int getUsertype(String logId);
}
