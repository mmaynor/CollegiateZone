package com.note.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.note.dao.DBUtil;
import com.note.model.StickyNote;

public class StickyNoteDaoImpl implements StickyNoteDao {
	public List<StickyNote> getStickyNoteDetails() {
		String sql = "Select * from StickyNote";
		ResultSet rs = null;
		StickyNote stickynote = null;
		List<StickyNote> stickynotes = new ArrayList<>();
		try (Connection conn = DBUtil.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(sql)) {
				rs = stmt.executeQuery();
				while(rs.next()) {
					stickynote = new StickyNote(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5));
						stickynotes.add(stickynote);
				}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return stickynotes;
	}
	
	public StickyNote getStickyNoteID(int noteId) { 
		String sql = "Select * from StickyNote where NOTEID = " + noteId;
		ResultSet rs = null;
		StickyNote stickynote = null;
		try (Connection conn = DBUtil.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(sql)) {
				rs = stmt.executeQuery();
				while(rs.next()) {
					stickynote = new StickyNote(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5));
				}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return stickynote;
	}
	
	public StickyNote updateStickyNote(StickyNote stickynote) { 
		String sql = "UPDATE stickynote	SET  title = ?, note = ?, stickyDate = ?, status = ? Where noteId = " + stickynote.getNoteId();
		ResultSet rs = null;

		try (Connection conn = DBUtil.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(sql)) {
				stmt.setString(1, stickynote.getTitle());
				stmt.setString(2, stickynote.getNote());
				stmt.setString(3, stickynote.getStickyDate());
				stmt.setString(4, stickynote.getStatus());
				
				stmt.executeUpdate();

		rs = stmt.getGeneratedKeys();
		if(rs.next()) {
			stickynote.setNoteId(rs.getInt(1));
		}
		
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return stickynote;
	}
	
	public void removeStickyNote(int noteid) { 
		String sql = "delete from stickynote where noteId =" + noteid;
		try (Connection conn = DBUtil.getConnection(); 
			PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.executeQuery();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public StickyNote insertStickyNote(StickyNote newStickyNote) {
		String sql = "Insert into StickyNote values(?,?,?,?,?)";
		ResultSet rs = null;

		try (Connection conn = DBUtil.getConnection(); 
				PreparedStatement stmt = conn.prepareStatement(sql)) {
				stmt.setInt(1, newStickyNote.getNoteId());
				stmt.setString(2, newStickyNote.getTitle());
				stmt.setString(3, newStickyNote.getNote());
				stmt.setString(4, newStickyNote.getStickyDate());
				stmt.setString(5, newStickyNote.getStatus());
				
				stmt.executeUpdate();

		rs = stmt.getGeneratedKeys();
		if(rs.next()) {
			newStickyNote.setNoteId(rs.getInt(1));
		}
		
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return newStickyNote;
	}
}
