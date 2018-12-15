package com.note.dao;

import java.util.List;

import com.note.model.*;

public interface StickyNoteDao {
	public StickyNote getStickyNoteID(int noteId);
	public StickyNote insertStickyNote(StickyNote newStickyNote);
	public StickyNote updateStickyNote(StickyNote stickynote);
	public List <StickyNote> getStickyNoteDetails();
	public void removeStickyNote(int noteid);

}
