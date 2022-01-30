package board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.model.FreeReplyVO;
import board.mapper.FreeReplyMapper;

@Service
public class FreeReplyService {

	@Autowired
	private FreeReplyMapper freereplyMapper;
	public boolean freereplyRegister(FreeReplyVO freereply) {
		if(freereplyMapper.insertReply(freereply)>0) {
			return true;
		}
		return false;
	}
	public boolean freereplyModify(FreeReplyVO freereply) {
		if(freereplyMapper.updateReply(freereply)>0) {
			return true;
		}
		return false;
	}
	public boolean freereplyRemove(int num) {
		if(freereplyMapper.deleteReply(num)>0) {
			return true;
		}
		return false;
	}
	public List<FreeReplyVO> freereplyGetAll(){
		return freereplyMapper.selectAll();
	}
	public FreeReplyVO freereplyGetone(int num) {
		return freereplyMapper.selectOne(num);
	}
	public List<FreeReplyVO> freeReplyByBoard(int fboardNum){
		return freereplyMapper.selectListByBnum(fboardNum);
	}
	public String idCheck(int num) {
		return freereplyMapper.replyUserIdCheck(num);
	}
	public List<FreeReplyVO> nRepliesGetByBNum(int fboardNum,int start,int end){
		return freereplyMapper.getListWithPaging(fboardNum, start, end);
	}
	//페이징
	public int getTotalReplies(int fboardNum) {
		return freereplyMapper.getTotalCountByBNum(fboardNum);
	}
	public int getReplyCount(int num) {
		return freereplyMapper.getReplyCnt(num);
	}
	
}
