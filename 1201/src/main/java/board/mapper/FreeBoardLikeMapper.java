package board.mapper;

import board.model.FreeLikeVO;


public interface FreeBoardLikeMapper {
	public int insert(FreeLikeVO like);
	public int update(FreeLikeVO like);
	public int delete(FreeLikeVO like);
}
