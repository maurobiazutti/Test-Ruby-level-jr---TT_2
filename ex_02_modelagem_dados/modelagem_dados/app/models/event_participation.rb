class EventParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  # Validações
  # Garante que um usuário não se inscreva duas vezes no mesmo evento
  validates :user_id, uniqueness: { scope: :event_id, message: "já está inscrito neste evento" }
  
  # Garante que 'present' comece como false por padrão se não for enviado
  validates :present, inclusion: { in: [true, false] }
end
