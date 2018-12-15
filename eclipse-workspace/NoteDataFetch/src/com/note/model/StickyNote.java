package com.note.model;

//@XmlRootElement
//@XmlType(propOrder= {"noteId", "title", "note", "stickyDate", "status"})
public class StickyNote {
	private int noteId;
	private String title;
	private String note;
	private String stickyDate;
	private String status;
	
	public StickyNote(int noteId, String title, String note, String stickyDate, String status) {
		this.noteId = noteId;
		this.title = title;
		this.note = note;
		this.stickyDate = stickyDate;
		this.status = status;
	}
	public StickyNote() {
		super();
	}

	public int getNoteId() {
		return noteId;
	}

	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getStickyDate() {
		return stickyDate;
	}

	public void setStickyDate(String stickyDate) {
		this.stickyDate = stickyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
