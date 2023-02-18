class OrderDetail < ApplicationRecord
  enum making_status_method: {
    cannot_start: 0,
    waiting_for_production: 1,
    production: 2,
    production_completed: 3
  }
end
