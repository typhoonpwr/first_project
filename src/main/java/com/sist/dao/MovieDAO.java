package com.sist.dao;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.*;

public class MovieDAO {
	private Connection conn;
	private PreparedStatement ps;

	public void getConnection() {
		try {
			Context init = new InitialContext();
			// JNDI => 디렉토리 형식 (탐색기)
			Context c = (Context) init.lookup("java://comp/env");
			// java://comp/env => Connection객체가 저장됨
			// jdbc/oracle => 저장된 주소의 별칭
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			// DataSource => 데이터베이스에 대한 모든 정보가 저장된 클래스
			conn = ds.getConnection();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// 2. 사용후에 반환
	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
			// 반환 => POOL영역에 설정 => 재사용
			// Connection객체의 갯수를 조정할 수 있다
			// 웹에서 일반적으로 사용되는 데이터베이스 프로그램
			// => ORM (MyBatis => DBCP)
		} catch (Exception ex) {
		}
	}

	// 영화 랭킹 관련
	public List<MovieVO> movieRanking() {
		List<MovieVO> list = new ArrayList<MovieVO>();

		try {
			getConnection();
			String sql = "SELECT m_no,m_title,m_poster,m_rate,m_director,rownum "
					+ "FROM (SELECT m_no,m_title,m_poster,m_rate,m_director FROM movie ORDER BY m_no ASC)"
					+ "WHERE rownum<=10";

			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				MovieVO vo = new MovieVO();
				vo.setM_no(rs.getInt(1));
				String title = rs.getString(2);
				if (title.length() >= 14) {
					vo.setM_title(title.substring(0, 14) + "…");
				} else {
					vo.setM_title(title);
				}
				vo.setM_poster(rs.getString(3));
				vo.setM_poster(rs.getString(3).substring(0, rs.getString(3).lastIndexOf("?")));
				vo.setM_rate(rs.getString(4));
				String director = rs.getString(5);
				if (director.length() >= 5) {
					vo.setM_director(director.substring(0, 5) + "…");
				} else {
					vo.setM_director(director);
				}

				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}

	// 영화 현재 상영작
	public List<MovieVO> movieListData() {
		List<MovieVO> list = new ArrayList<MovieVO>();
		try {
			getConnection();
			String sql = "SELECT m_no,m_title,m_poster,m_rate,m_director " + "FROM movie "
					+ "WHERE m_rdate  LIKE '2022 .01.%' OR m_rdate LIKE '2022 .02.%' " + "ORDER BY m_no ASC";

			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MovieVO vo = new MovieVO();
				vo.setM_no(rs.getInt(1));
				String title = rs.getString(2);
				if (title.length() >= 17) {
					vo.setM_title(title.substring(0, 15) + "…");
				} else {
					vo.setM_title(title);
				}
				vo.setM_poster(rs.getString(3));
				vo.setM_rate(rs.getString(4));
				String director = rs.getString(5);
				if (director.length() >= 9) {
					vo.setM_director(director.substring(0, 9) + "…");
				} else {
					vo.setM_director(director);
				}

				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}

	// 상세페이지
	public MovieVO movieDetailData(int no) {
		MovieVO vo = new MovieVO();
		try {
			getConnection();
			String sql = "SELECT * FROM movie WHERE m_no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setM_no(rs.getInt(1));
			vo.setM_title(rs.getString(2));
			vo.setM_genre(rs.getString(3));
			vo.setM_poster(rs.getString(4));
			vo.setM_time(rs.getString(5));
			vo.setM_director(rs.getString(6));
			vo.setM_cast(rs.getString(7));
			vo.setM_rdate(rs.getString(8));
			vo.setM_rate(rs.getString(9));
			vo.setM_cnt(rs.getString(10));
			vo.setM_preview(rs.getString(11));
			vo.setM_photo(rs.getString(12));
			vo.setM_content(rs.getString(13));

			rs.close();

		} catch (Exception e) {
		} finally {
			disConnection();
		}
		return vo;
	}
}
/*
 * // 영화 상영 예정작 public List<MovieVO> movieListData2() { List<MovieVO> list = new
 * ArrayList<MovieVO>(); try { cm.getConnection(); String sql =
 * "SELECT m_no,m_title,m_poster,m_rate,m_director " + "FROM movie " +
 * "WHERE m_rdate LIKE '2022 .03%'" + "or m_rdate LIKE '2022 .04%' " +
 * "or m_rdate LIKE '2022 .05%' " + "or m_rdate LIKE '2022 .06%' " +
 * "or m_rdate LIKE '2022 .07%' " + "OR m_rdate LIKE '2022 .08%' " +
 * "OR m_rdate LIKE '2022 .09%' " + "OR m_rdate LIKE '2022 .10%' " +
 * "OR m_rdate LIKE '2022 .11%' " + "OR m_rdate LIKE '2022 .12%'";
 * 
 * ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery(); while
 * (rs.next()) { MovieVO vo = new MovieVO(); vo.setM_no(rs.getInt(1));
 * vo.setM_title(rs.getString(2)); vo.setM_poster(rs.getString(3));
 * vo.setM_rate(rs.getString(4)); vo.setM_director(rs.getString(5));
 * 
 * list.add(vo); } rs.close(); } catch (Exception e) { e.printStackTrace(); }
 * finally { cm.disConnection(conn, ps); } return list; }
 */
/*

*/
