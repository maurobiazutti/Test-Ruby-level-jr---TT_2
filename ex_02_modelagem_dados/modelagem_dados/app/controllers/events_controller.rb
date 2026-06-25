class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    
    # Busca os prêmios do evento
    @prizes = @event.prizes
    
    # Separa os usuários usando os escopos da tabela intermediária
    @present_users = @event.users.where(event_participations: { present: true })
    @absent_users  = @event.users.where(event_participations: { present: false })
  end
end
