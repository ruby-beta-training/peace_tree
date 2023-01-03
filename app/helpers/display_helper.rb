module DisplayHelper
  DASH_MASK = '--'.freeze

  def display_nilable(value)
    value.presence || DASH_MASK
  end
end
