package com.team1.careercanvas.mapper;

import com.team1.careercanvas.vo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {

    int CheckForBoardView(int id);

    void UpdatePost(BoardVO bvo);

    int deletePost(int postid);

    void InsertNewPost(BoardVO vo);

    List<BoardVO> getPost(PagingVO pvo);

    List<BoardVO> getPostWithCat(PagingVO pvo);

    int getPostAmount(PagingVO pvo);

    int getPostAmountWithCat(PagingVO pvo);

    int reportPost(int target_id, String target_userid, String target_title, String userid);

    // 권혁준 작업
    List<BoardVO> getmyPost(PagingVO pVO);

    int getmyPostAmount(PagingVO pVO);

    List<CommentVO> getmyComment(PagingVO pVO);

    int getmyCommentCount(PagingVO pVO);

    void saveSendMsg(String Logid, String receiveUser, String content);

    // 정인식 작업 ( 글내용보기 )
    BoardVO SelectBoardView(int postid);

    void ViewsCount(int postid);

    void LikeCount(int postid, String userid);
    void MinusViewsCount(int postid);

    int CheckValid(int postid, String userid);

    int GetLikeAmount(int postid);

    // 권혁준 작업
    List<SubjectVO> getSubjectList(PagingVO pVO);

    List<ApplyVO> getSubjectApplyList(PagingVO pVo);

    int getSubjectListAmount();

    int getSubjectApplyCount();

    List<ApplyVO> getSubjectApplyTeamList(PagingVO pVO);

    int getSubjectApplyTeamCount();


}
