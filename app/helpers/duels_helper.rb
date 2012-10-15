module DuelsHelper
  def navigate_duels_links
    links = []
    if duel = @duel.previous
      links << link_to('PREVIOUS', duel)
    end
    if duel = @duel.next
      links << link_to('NEXT', duel)
    end
    links.join(' / ').html_safe
  end
end
