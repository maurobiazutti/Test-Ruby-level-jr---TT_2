class Prize < ApplicationRecord
  # Relacionamentos
  belongs_to :event
  # O ganhador é opcional porque o prêmio é cadastrado antes do sorteio acontecer
  belongs_to :winner, class_name: 'User', optional: true

  # Validações básicas
  validates :title, presence: true

  # Validações customizadas de Regra de Negócio
  validate :event_prizes_limit, on: :create
  validate :winner_must_be_present_at_event, if: :winner_id?

  private

  # Regra 1: Cada evento possui ATÉ 3 prêmios
  def event_prizes_limit
    if event && event.prizes.count >= 3
      errors.add(:base, "Este evento já atingiu o limite máximo de 3 prêmios.")
    end
  end

  # Regra 2: Prêmios são distribuídos APENAS entre os usuários presentes
  def winner_must_be_present_at_event
    # Busca a inscrição/participação do ganhador neste evento específico
    participation = event.event_participations.find_by(user_id: winner_id)

    # Se não houver inscrição ou se houver mas ele não foi ao evento:
    if participation.nil? || !participation.present?
      errors.add(:winner, "deve estar presente no evento para ganhar o prêmio.")
    end
  end
end