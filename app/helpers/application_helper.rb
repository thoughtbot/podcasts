module ApplicationHelper
  def format_podcast_notes(notes)
    BlueCloth.new(notes).to_html
  end
end
